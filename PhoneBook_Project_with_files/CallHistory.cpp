#include "CallHistory.h"

CallHistory::CallHistory(QObject *parent)
    : ContactDataModel(parent)
{
    qDebug() << "CallHistory constructed";
}

CallHistory::~CallHistory()
{
    qDebug() << "CallHistory destroyed";
}

Contact* CallHistory::createContactData()
{
    return new Contact(QString(), QString(), QString(), QString(), false, false, QString(), nullptr);
}

/*void CallHistory::insertContactData(Contact *cobj)
{
    Contact *c = createContactData();
    if (cobj) {
        c->setName(cobj->name());
        c->setNumber(cobj->number());
        c->setImage(cobj->image());
        c->setCallTime(cobj->callTime());
        c->setIsIncoming(cobj->isIncoming());
        c->setIsOutgoing(cobj->isOutgoing());
        c->setShortMessage(cobj->shortMessage());
        delete cobj;
    }
    ContactDataModel::insertContactData(c);
}*/

void CallHistory::insertContactData(Contact *cobj)
{
    if (!cobj) return;

    beginInsertRows(QModelIndex(), m_contacts.size(), m_contacts.size());

    Contact* newContact = new Contact(cobj->name(),cobj->number(),cobj->image(),cobj->callTime(),cobj->isIncoming(),
        cobj->isOutgoing(),cobj->shortMessage(),this);

    m_contacts.append(newContact);

    endInsertRows();

    delete cobj;
}


Contact* CallHistory::getContactData(int index) const
{
    return ContactDataModel::getContactData(index);
}

int CallHistory::count() const
{
    return ContactDataModel::count();
}
