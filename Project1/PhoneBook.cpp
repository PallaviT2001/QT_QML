#include "PhoneBook.h"

PhoneBook::PhoneBook(QObject *parent)
    : ContactDataModel(parent)
{
    qDebug() << "PhoneBook constructed";
}

PhoneBook::~PhoneBook()
{
    qDebug() << "PhoneBook destroyed";
}

Contact* PhoneBook::createContactData()
{
    // default contact for phonebook (will be overwritten if prototype provided)
    return new Contact(QString(), QString(), QString(), QString(), false, false, QString(), nullptr);
}

void PhoneBook::insertContactData(Contact *prototype)
{
    // Create a real object via factory function then copy prototype values if present
    Contact *c = createContactData();
    if (prototype) {
        c->setName(prototype->name());
        c->setNumber(prototype->number());
        c->setImage(prototype->image());
        c->setCallTime(prototype->callTime());
        c->setIsIncoming(prototype->isIncoming());
        c->setIsOutgoing(prototype->isOutgoing());
        c->setShortMessage(prototype->shortMessage());
        delete prototype; // prototype used only to transfer data
    }
    // Now append to model (base handles parent and signals)
    ContactDataModel::insertContactData(c);
}

Contact* PhoneBook::getContactData(int index) const
{
    return ContactDataModel::getContactData(index);
}

int PhoneBook::count() const
{
    return ContactDataModel::count();
}
