#include "contactmodel.h"
#include <QDebug>

ContactModel::ContactModel(QObject *parent)
    : QAbstractListModel(parent)
{
    // Initial data
    m_contactList.append(new Contact("Rahul Sharma", "9876543210"));
    m_contactList.append(new Contact("Priya Mehta", "9876501234"));
    m_contactList.append(new Contact("Amit Verma", "9812345678"));
}

ContactModel::~ContactModel()
{
    qDeleteAll(m_contactList);
    m_contactList.clear();
}

int ContactModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return m_contactList.size();
}

QVariant ContactModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_contactList.size())
        return QVariant();

    Contact *contact = m_contactList.at(index.row());

    switch (role) {
    case ContactNameRole:
        return contact->contactName();
    case ContactNumberRole:
        return contact->contactNumber();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> ContactModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[ContactNameRole] = "contactName";
    roles[ContactNumberRole] = "contactNumber";
    return roles;
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
    // Example bulk add
    addContact("Siddharth Rao", "9876001122");
    addContact("Pooja Iyer", "9865321478");
    addContact("Karthik Menon", "9890456123");
}

int ContactModel::getSize() const
{
    return m_contactList.size();
}
