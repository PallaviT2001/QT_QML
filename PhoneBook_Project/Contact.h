#ifndef CONTACT_H
#define CONTACT_H
#include <QObject>
#include <QString>

class Contact : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString contactName READ contactName WRITE setContactName NOTIFY contactChanged)
    Q_PROPERTY(QString contactNumber READ contactNumber WRITE setContactNumber NOTIFY contactChanged)
    Q_PROPERTY(QString contactImage READ contactImage WRITE setContactImage NOTIFY contactChanged)

public:
    explicit Contact(QObject *parent = nullptr) : QObject(parent) {}
    Contact(const QString &name, const QString &number, const QString &image, QObject *parent = nullptr)
        : QObject(parent), m_contactName(name), m_contactNumber(number), m_contactImage(image) {}
    QString contactName() const;
    QString contactNumber() const;
    QString contactImage() const;
    void setContactName(const QString &name);
    void setContactNumber(const QString &number);
    void setContactImage(const QString &image);

signals:
    void contactChanged();

private:
    QString m_contactName;
    QString m_contactNumber;
    QString m_contactImage;
};

#endif






