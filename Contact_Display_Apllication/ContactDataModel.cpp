#include "ContactDataModel.h"
#include <QDebug>

ContactDataModel::ContactDataModel(QObject *parent)
    : QAbstractListModel(parent)
{
    m_contacts.append(new Contact("Pallavi", "9876543210", "alice.png", "01:30 PM", true, false, "HII", this));
    m_contacts.append(new Contact("Dharshini", "9123456780", "bob.png", "10:00 AM", false, true, "See you soon!", this));
    m_contacts.append(new Contact("Likitha", "9988776655", "charlie.png", "05:15 AM", true, false, "Let's catch up", this));
    m_contacts.append(new Contact("Varshini", "9011223344", "david.png", "04:15 AM", false, true, "Thanks!", this));
    m_contacts.append(new Contact("vidya", "9345678901", "emma.png", "yesterday", true, false, "Good morning ☀️", this));
    m_contacts.append(new Contact("Navya", "9456123789", "frank.png", "Yesterday", false, true, "Sure!", this));
    m_contacts.append(new Contact("Divya", "9567890123", "grace.png", "yesterday", true, false, "Let's meet tomorrow", this));
    m_contacts.append(new Contact("Gagana", "9678901234", "hannah.png", "yesterday", false, true, "Happy Birthday 🎉", this));
    m_contacts.append(new Contact("Ashwini", "9789012345", "ian.png", "yesterday", true, false, "Where are you?", this));
    m_contacts.append(new Contact("Darshini", "9890123456", "jack.png", "Yesterday", false, true, "On my way!", this));
}

int ContactDataModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_contacts.count();
}

QVariant ContactDataModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() < 0 || index.row() >= m_contacts.count())
        return QVariant();

    Contact *contact = m_contacts.at(index.row());

    switch (role) {
    case NameRole:
        return contact->name();
    case NumberRole:
        return contact->number();
    case ImageRole:
        return contact->image();
    case CallTimeRole:
        return contact->callTime();
    case IsIncomingRole:
        return contact->isIncoming();
    case IsOutgoingRole:
        return contact->isOutgoing();
    case ShortMessageRole:
        return contact->shortMessage();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> ContactDataModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    roles[NumberRole] = "number";
    roles[ImageRole] = "image";
    roles[CallTimeRole] = "callTime";
    roles[IsIncomingRole] = "isIncoming";
    roles[IsOutgoingRole] = "isOutgoing";
    roles[ShortMessageRole] = "shortMessage";
    return roles;
}

void ContactDataModel::addContact(Contact *contact)
{
    beginInsertRows(QModelIndex(), m_contacts.size(), m_contacts.size());
    m_contacts.append(contact);
    endInsertRows();
}
