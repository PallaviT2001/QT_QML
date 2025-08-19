#include "Backendoperations.h"
#include <QJSEngine>
#include <QJSValue>
#include <QtMath>

BackendOperations::BackendOperations(QObject *parent)
    : QObject(parent), m_displayText("")
{
    // Define all buttons here (label + color)
    auto addButton = [&](const QString &label, const QString &color) {
        QVariantMap btn;
        btn["text"] = label;
        btn["color"] = color;
        m_buttons.append(btn);
    };

    // Row 1
    addButton("AC", "#ff8c00");
    addButton("%",  "blue");
    addButton("←",  "blue");
    addButton("÷",  "blue");

    // Row 2
    addButton("7", "#2c2c2c");
    addButton("8", "#2c2c2c");
    addButton("9", "#2c2c2c");
    addButton("×", "blue");

    // Row 3
    addButton("4", "#2c2c2c");
    addButton("5", "#2c2c2c");
    addButton("6", "#2c2c2c");
    addButton("-", "blue");

    // Row 4
    addButton("1", "#2c2c2c");
    addButton("2", "#2c2c2c");
    addButton("3", "#2c2c2c");
    addButton("+", "blue");

    // Row 5
    addButton("00", "#2c2c2c");
    addButton("0",  "#2c2c2c");
    addButton(".",  "#2c2c2c");
    addButton("=",  "green");
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
            QString out = QString::number(val, 'g', 15);
            m_displayText = out;
        } else {
            m_displayText = "Error";
        }
    }
    emit displayTextChanged();
}
