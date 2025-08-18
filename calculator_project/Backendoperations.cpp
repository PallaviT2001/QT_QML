#include "Backendoperations.h"
#include <QJSEngine>
#include <QJSValue>
#include <QtMath>

BackendOperations::BackendOperations(QObject *parent)
    : QObject(parent), m_displayText("")
{
}

bool BackendOperations::isOperator(QChar c) const
{
    return c == '+' || c == '-' || c == '%' || c == u'×' || c == u'÷' || c == '*' || c == '/';
}

bool BackendOperations::endsWithOperator(const QString &s) const
{
    if (s.isEmpty()) return false;
    return isOperator(s.back());
}

void BackendOperations::handleButtonClick(const QString &text)
{
    if (text == "AC") {
        m_displayText.clear();
        emit displayTextChanged();
        return;
    }

    if (text == "←") {
        if (!m_displayText.isEmpty())
            m_displayText.chop(1);
        emit displayTextChanged();
        return;
    }

    if (text == "=") {
        calculateResult();
        return;
    }

    if (text.size() == 1 && isOperator(text.at(0))) {
        const QChar c = text.at(0);

        if (m_displayText.isEmpty()) {
            if (c == '-') {
                m_displayText.append(c);
                emit displayTextChanged();
            }
            return;
        }

        if (endsWithOperator(m_displayText)) {
            m_displayText.chop(1);
        }
        m_displayText.append(c);
        emit displayTextChanged();
        return;
    }

    if (text == ".") {
        int i = m_displayText.size() - 1;
        while (i >= 0 && !isOperator(m_displayText.at(i))) --i;
        const QString currentToken = m_displayText.mid(i + 1);
        if (currentToken.contains('.'))
            return;
    }

    m_displayText.append(text);
    emit displayTextChanged();
}

void BackendOperations::calculateResult()
{
    if (m_displayText.isEmpty()) return;

    QString expr = m_displayText;
    expr.replace(u'×', '*');
    expr.replace(u'÷', '/');

    if (endsWithOperator(expr))
        expr.chop(1);

    QJSEngine engine;
    QJSValue result = engine.evaluate(expr);

    if (result.isError()) {
        m_displayText = "Error";
    } else {
        const double val = result.toNumber();
        if (std::isfinite(val)) {
            // Pretty formatting: up to 15 significant digits, trim trailing zeros
            QString out = QString::number(val, 'g', 15);
            m_displayText = out;
        } else {
            m_displayText = "Error";
        }
    }
    emit displayTextChanged();
}
