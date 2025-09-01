#include "ContactModelManager.h"
#include "PhoneBook.h"
#include "CallHistory.h"
#include "WhatsApp.h"
#include "Contact.h"
#include <QDebug>

ContactModelManager::ContactModelManager(QObject *parent)
    : QObject(parent),
    m_contactModel(nullptr)
{
}

ContactModelManager::~ContactModelManager()
{
    if (m_contactModel) {
        delete m_contactModel;
        m_contactModel = nullptr;
    }
}

ContactDataModel* ContactModelManager::contactModel() const
{
    return m_contactModel;
}

void ContactModelManager::setModel(ContactDataModel* model)
{
    if (m_contactModel) {
        delete m_contactModel;
        m_contactModel = nullptr;
    }
    m_contactModel = model;
    if (m_contactModel) {
        // make manager the parent so lifetime is managed
        m_contactModel->setParent(this);
    }
    emit contactModelChanged();
}

void ContactModelManager::createPhoneBook()
{
    PhoneBook* m = new PhoneBook(nullptr);
    setModel(m);

    // Prepopulate using insertContactData(prototype)
    m->insertContactData(new Contact("Pallavi", "9876543210", "alice.png", "01:30 PM", true, false, "HII"));
    m->insertContactData(new Contact("Dharshini", "9123456780", "bob.png", "10:00 AM", false, true, "See you soon!"));
    m->insertContactData(new Contact("Likitha", "9988776655", "charlie.png", "05:15 AM", true, false, "Let's catch up"));
    m->insertContactData(new Contact("Varshini", "9011223344", "david.png", "04:15 AM", false, true, "Thanks!"));
    m->insertContactData(new Contact("Vidya", "9345678901", "emma.png", "Yesterday", true, false, "Good morning ☀️"));
    m->insertContactData(new Contact("Navya", "9456123789", "frank.png", "Yesterday", false, true, "Sure!"));
    m->insertContactData(new Contact("Divya", "9567890123", "grace.png", "Yesterday", true, false, "Let's meet tomorrow"));
    m->insertContactData(new Contact("Gagana", "9678901234", "hannah.png", "Yesterday", false, true, "Happy Birthday 🎉"));
    m->insertContactData(new Contact("Ashwini", "9789012345", "ian.png", "Yesterday", true, false, "Where are you?"));
    m->insertContactData(new Contact("Darshini", "9890123456", "jack.png", "Yesterday", false, true, "On my way!"));
}

void ContactModelManager::createCallHistory()
{
    CallHistory* m = new CallHistory(nullptr);
    setModel(m);

    // Example call-history style entries (callTime different, incoming/outgoing toggled)
    m->insertContactData(new Contact("Pallavi", "9876543210", "alice.png", "Today 01:30 PM", true, false, ""));
    m->insertContactData(new Contact("Dharshini", "9123456780", "bob.png", "Today 10:00 AM", false, true, ""));
    m->insertContactData(new Contact("Likitha", "9988776655", "charlie.png", "Today 05:15 AM", true, false, ""));
    m->insertContactData(new Contact("Varshini", "9011223344", "david.png", "Yesterday 04:15 AM", false, true, ""));
    m->insertContactData(new Contact("Vidya", "9345678901", "emma.png", "Yesterday", true, false, ""));
    m->insertContactData(new Contact("Navya", "9456123789", "frank.png", "Yesterday", false, true, ""));
    m->insertContactData(new Contact("Divya", "9567890123", "grace.png", "Yesterday", true, false, ""));
    m->insertContactData(new Contact("Gagana", "9678901234", "hannah.png", "Yesterday", false, true, ""));
    m->insertContactData(new Contact("Ashwini", "9789012345", "ian.png", "Yesterday", true, false, ""));
    m->insertContactData(new Contact("Darshini", "9890123456", "jack.png", "Yesterday", false, true, ""));
}

void ContactModelManager::createWhatsApp()
{
    WhatsApp* m = new WhatsApp(nullptr);
    setModel(m);

    // Sample whatsapp-like entries (shortMessage filled)
    m->insertContactData(new Contact("Pallavi", "9876543210", "alice.png", "01:30 PM", false, false, "HII"));
    m->insertContactData(new Contact("Dharshini", "9123456780", "bob.png", "10:00 AM", false, false, "See you soon!"));
    m->insertContactData(new Contact("Likitha", "9988776655", "charlie.png", "05:15 AM", false, false, "Let's catch up"));
    m->insertContactData(new Contact("Varshini", "9011223344", "david.png", "04:15 AM", false, false, "Thanks!"));
    m->insertContactData(new Contact("Vidya", "9345678901", "emma.png", "Yesterday", false, false, "Good morning ☀️"));
    m->insertContactData(new Contact("Navya", "9456123789", "frank.png", "Yesterday", false, false, "Sure!"));
    m->insertContactData(new Contact("Divya", "9567890123", "grace.png", "Yesterday", false, false, "Let's meet tomorrow"));
    m->insertContactData(new Contact("Gagana", "9678901234", "hannah.png", "Yesterday", false, false, "Happy Birthday 🎉"));
    m->insertContactData(new Contact("Ashwini", "9789012345", "ian.png", "Yesterday", false, false, "Where are you?"));
    m->insertContactData(new Contact("Darshini", "9890123456", "jack.png", "Yesterday", false, false, "On my way!"));
}

void ContactModelManager::addContact(const QString &name, const QString &number, const QString &image,
                                     const QString &callTime, bool isIncoming,
                                     bool isOutgoing, const QString &shortMessage)
{
    if (!m_contactModel) {
        // default to phonebook if no model selected
        createPhoneBook();
    }
    // pass a prototype that will be copied by the model's insertContactData
    m_contactModel->insertContactData(new Contact(name, number, image, callTime, isIncoming, isOutgoing, shortMessage));
}
