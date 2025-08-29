#ifndef CONTACT_H
#define CONTACT_H
#include <QString>
#include <QObject>

class Contact : public QObject
{
    Q_OBJECT
public:
    Contact();
    ~Contact();
    Contact(QString name, QString number);

    QString contactName() const;
    void setContactName(const QString &newContactName);

    QString contactNumber() const;
    void setContactNumber(const QString &newContactNumber);

private:
    QString m_contactName;
    QString m_contactNumber;
};

#endif
