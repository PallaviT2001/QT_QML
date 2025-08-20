#ifndef BACKENDOPERATIONS_H
#define BACKENDOPERATIONS_H
#include <QObject>
#include <QString>
#include <QVariantList>

class BackendOperations : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString displayText READ displayText NOTIFY displayTextChanged)
    Q_PROPERTY(QVariantList buttons READ buttons CONSTANT)
    Q_PROPERTY(int rows READ rows CONSTANT)
    Q_PROPERTY(int columns READ columns CONSTANT)

public:
    explicit BackendOperations(QObject *parent = nullptr);

    QString displayText() const { return m_displayText; }
    QVariantList buttons() const { return m_buttons; }

    int rows() const { return m_rows; }
    int columns() const { return m_columns; }

    Q_INVOKABLE void handleButtonClick(const QString &text);

signals:
    void displayTextChanged();

private:
    QString m_displayText;
    QVariantList m_buttons;
    int m_rows;
    int m_columns;

    bool endsWithOperator(const QString &s) const;
    bool isOperator(QChar c) const;
    void calculateResult();
};

#endif // BACKENDOPERATIONS_H

