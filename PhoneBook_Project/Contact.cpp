#include "Contact.h"

QString Contact::contactName() const
{
    return m_contactName;
}

QString Contact::contactNumber() const
{
    return m_contactNumber;
}

QString Contact::contactImage() const
{
    return m_contactImage;
}

void Contact::setContactName(const QString &name)
{
    m_contactName = name;
    emit contactChanged();
}

void Contact::setContactNumber(const QString &number)
{
    m_contactNumber = number;
    emit contactChanged();
}

void Contact::setContactImage(const QString &image)
{
    m_contactImage = image;
    emit contactChanged();
}
