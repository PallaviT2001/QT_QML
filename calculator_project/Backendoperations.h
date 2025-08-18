#ifndef BACKENDOPERATIONS_H
#define BACKENDOPERATIONS_H

#include <QObject>
#include <QString>

class BackendOperations : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString displayText READ displayText NOTIFY displayTextChanged)

public:
    explicit BackendOperations(QObject *parent = nullptr);

    QString displayText() const { return m_displayText; }
    Q_INVOKABLE void handleButtonClick(const QString &text);

signals:
    void displayTextChanged();

private:
    QString m_displayText;

    bool endsWithOperator(const QString &s) const;
    bool isOperator(QChar c) const;
    void calculateResult();
};

#endif // BACKENDOPERATIONS_H
