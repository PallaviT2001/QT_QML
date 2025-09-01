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
        m_contactModel->setParent(this);
    }
    emit contactModelChanged();
}

void ContactModelManager::createPhoneBook()
{
    PhoneBook* m = new PhoneBook(nullptr);
    setModel(m);

    m->insertContactData(new Contact("Pallavi", "9876543210", "", "", false, false, ""));
    m->insertContactData(new Contact("Dharshini", "9123456780", "", "", false, false, ""));
    m->insertContactData(new Contact("Likitha", "9988776655", "", "", false, false, ""));
    m->insertContactData(new Contact("Varshini", "9011223344", "", "", false, false, ""));
    m->insertContactData(new Contact("Vidya", "9345678901", "", "", false, false, ""));
    m->insertContactData(new Contact("Navya", "9456123789", "", "", false, false, ""));
    m->insertContactData(new Contact("Divya", "9567890123", "", "", false, false, ""));
    m->insertContactData(new Contact("Gagana", "9678901234", "", "", false, false, ""));
    m->insertContactData(new Contact("Ashwini", "9789012345", "", "", false, false, ""));
    m->insertContactData(new Contact("Darshini", "9890123456", "", "", false, false, ""));
}

void ContactModelManager::createCallHistory()
{
    CallHistory* m = new CallHistory(nullptr);
    setModel(m);

    m->insertContactData(new Contact("Pallavi", "9876543210"," ","incoming 7:15 AM", true, false, ""));
    m->insertContactData(new Contact("Dharshini", "9876543210"," ","outgoing 7:15 AM", true, false, ""));
    m->insertContactData(new Contact("Vidya", "9876543210"," ","outgoing 7:15 AM", true, false, ""));
    m->insertContactData(new Contact("Varshini", "9876543210"," ","outgoing 7:15 AM", true, false, ""));
    m->insertContactData(new Contact("Gagana", "9876543210"," ","outgoing 7:15 AM", true, false, ""));
    m->insertContactData(new Contact("Likitha", "9876543210"," ","incoming 7:15 AM", true, false, ""));
    m->insertContactData(new Contact("Bavya", "9876543210"," ","incoming 7:15 AM", true, false, ""));
    m->insertContactData(new Contact("Kavya", "9876543210"," ","incoming 7:15 AM", true, false, ""));
    m->insertContactData(new Contact("Alice", "9876543210"," ","incoming 7:15 AM", true, false, ""));
    m->insertContactData(new Contact("Bob", "9876543210"," ","incoming 7:15 AM", true, false, ""));
}

void ContactModelManager::createWhatsApp()
{
    WhatsApp* m = new WhatsApp(nullptr);
    setModel(m);

    m->insertContactData(new Contact("Pallavi", "9876543210", "", "01:30 PM", false, false, "Hii"));
    m->insertContactData(new Contact("Dharshini", "9123456780", "", "10:00 AM", false, false, "See you soon"));
    m->insertContactData(new Contact("Likitha", "9988776655", "", "05:15 AM", false, false, "Let's catch up"));
    m->insertContactData(new Contact("Varshini", "9011223344", "", "04:15 AM", false, false, "Thanks"));
    m->insertContactData(new Contact("Vidya", "9345678901", "", "Yesterday", false, false, "Good morning️"));
    m->insertContactData(new Contact("Navya", "9456123789", "", "Yesterday", false, false, "Sure"));
    m->insertContactData(new Contact("Divya", "9567890123", "", "Yesterday", false, false, "Let's meet tomorrow"));
    m->insertContactData(new Contact("Gagana", "9678901234", "", "Yesterday", false, false, "Happy Birthday"));
    m->insertContactData(new Contact("Ashwini", "9789012345", "", "Yesterday", false, false, "Where are you?"));
    m->insertContactData(new Contact("Darshini", "9890123456", "", "Yesterday", false, false, "On my way!"));
}

void ContactModelManager::addContact(const QString &name, const QString &number, const QString &image,
                                     const QString &callTime, bool isIncoming,
                                     bool isOutgoing, const QString &shortMessage)
{
    if (!m_contactModel)
    {
        createPhoneBook();
    }
    m_contactModel->insertContactData(new Contact(name, number, image, callTime, isIncoming, isOutgoing, shortMessage));
}
