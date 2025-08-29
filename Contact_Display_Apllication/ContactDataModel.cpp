#include "ContactDataModel.h"

ContactDataModel::ContactDataModel(QObject *parent): QAbstractListModel(parent)
{
    m_contacts.append(new Contact("Pallavi", "9876543210", ""));
    m_contacts.append(new Contact("Dharshini", "9876501234", ""));
    m_contacts.append(new Contact("Vidya", "9812345678", ""));
    m_contacts.append(new Contact("Likitha", "9876543210", ""));
    m_contacts.append(new Contact("Nithya", "9876543210", ""));
    m_contacts.append(new Contact("Bhavya", "9876543210", ""));
    m_contacts.append(new Contact("Kaavya", "9876543210", ""));
    m_contacts.append(new Contact("Dhanu", "9876543210", ""));
    m_contacts.append(new Contact("Gagana", "9876543210", ""));
    m_contacts.append(new Contact("Varshini", "9876543210", ""));
}

int ContactDataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_contacts.count();
}

QVariant ContactDataModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() < 0 || index.row() >= m_contacts.size())
        return QVariant();

    Contact *contact = m_contacts.at(index.row());
    switch (role) {
    case NameRole: return contact->contactName();
    case NumberRole: return contact->contactNumber();
    case ImageRole: return contact->contactImage();
    default: return QVariant();
    }
}

QHash<int, QByteArray> ContactDataModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NameRole] = "contactName";
    roles[NumberRole] = "contactNumber";
    roles[ImageRole] = "contactImage";
    return roles;
}

void ContactDataModel::addContact(const QString &name, const QString &number, const QString &image)
{
    beginInsertRows(QModelIndex(), m_contacts.size(), m_contacts.size());
    m_contacts.append(new Contact(name, number, image));
    endInsertRows();
}
