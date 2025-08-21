#ifndef CONTACT_H
#define CONTACT_H

#include <QString>
#include <QObject>

class Contact : public QObject
{
    Q_OBJECT
public:
    explicit Contact(const QString &name = QString(),
                     const QString &number = QString(),
                     QObject *parent = nullptr);

    QString contactName() const;
    void setContactName(const QString &newContactName);

    QString contactNumber() const;
    void setContactNumber(const QString &newContactNumber);

private:
    QString m_contactName;
    QString m_contactNumber;
};

#endif // CONTACT_H
