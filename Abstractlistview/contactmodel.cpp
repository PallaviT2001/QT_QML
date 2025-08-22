#include "contactmodel.h"
#include <QDebug>

ContactModel::ContactModel(QObject *parent)
    : QAbstractListModel(parent)
{
    m_contactList.append(new Contact("Pallavi1", "9876543210"));
    m_contactList.append(new Contact("Pallavi2", "9876501234"));
    m_contactList.append(new Contact("Pallavi3", "9812345678"));
    m_contactList.append(new Contact("Pallavi4", "9874563210"));
    m_contactList.append(new Contact("Pallavi5", "9876543210"));
    m_contactList.append(new Contact("Pallavi6", "9876501234"));
    m_contactList.append(new Contact("Pallavi7", "9812345678"));
    m_contactList.append(new Contact("Pallavi8", "9874563210"));
    m_contactList.append(new Contact("Pallavi9", "9874563210"));
    m_contactList.append(new Contact("Pallavi10", "9874563210"));
    qDebug()<<"Size in constructor :"<<m_contactList.size();

}

ContactModel::~ContactModel()
{
    qDebug()<<"Contact model destructor called";
}

void ContactModel::addContact(const QString &name, const QString &number)
{
    beginInsertRows(QModelIndex(), m_contactList.size(), m_contactList.size());
    m_contactList.append(new Contact(name, number));
    endInsertRows();
    qDebug() << "Added contact:" << name << number;
}

void ContactModel::addNumberButtonClicked()
{

    addContact("Pallavi11", "9874563210");
    addContact("Pallavi12", "9874563210");
    addContact("Pallavi13", "9874563210");

}

int ContactModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_contactList.size();
}

QVariant ContactModel::data(const QModelIndex &index, int role) const
{

    Contact *contact = m_contactList.at(index.row());

    switch (role) {
    case ContactNameRole:
        return contact->contactName();
    case ContactNumberRole:
        return contact->contactNumber();
    default:
        return QVariant();
    }
    return QVariant();
}

QHash<int, QByteArray> ContactModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[ContactNameRole] = "contactName";
    roles[ContactNumberRole] = "contactNumber";
    return roles;
}

int ContactModel::getSize() const
{
    return m_contactList.size();
}
