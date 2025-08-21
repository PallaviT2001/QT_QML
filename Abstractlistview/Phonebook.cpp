#include "Phonebook.h"

Contact::Contact(const QString &name, const QString &number, QObject *parent)
    : QObject(parent),
    m_contactName(name),
    m_contactNumber(number)
{
}

QString Contact::contactName() const
{
    return m_contactName;
}

void Contact::setContactName(const QString &newContactName)
{
    m_contactName = newContactName;
}

QString Contact::contactNumber() const
{
    return m_contactNumber;
}

void Contact::setContactNumber(const QString &newContactNumber)
{
    m_contactNumber = newContactNumber;
}
