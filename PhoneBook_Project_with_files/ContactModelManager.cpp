#include "ContactModelManager.h"
#include "PhoneBook.h"
#include "CallHistory.h"
#include "WhatsApp.h"
#include "CsvLoader.h"

#include <QDebug>
#include <QDateTime>

ContactModelManager::ContactModelManager(QObject *parent)
    : QObject(parent),
    m_contactModel(nullptr),
    m_phoneBook(nullptr),
    m_callHistory(nullptr),
    m_whatsApp(nullptr)
{
}

ContactModelManager::~ContactModelManager()
{
    if (m_phoneBook && m_phoneBook->parent() != this) delete m_phoneBook;
    if (m_callHistory && m_callHistory->parent() != this) delete m_callHistory;
    if (m_whatsApp && m_whatsApp->parent() != this) delete m_whatsApp;
    m_contactModel = nullptr;
}

ContactDataModel* ContactModelManager::contactModel() const
{
    return m_contactModel;
}

void ContactModelManager::setModel(ContactDataModel* model)
{
    if (model) model->setParent(this);
    m_contactModel = model;
    emit contactModelChanged();
}

void ContactModelManager::createPhoneBook()
{
    if (!m_phoneBook) {
        m_phoneBook = new PhoneBook(this);
        QList<Contact*> contacts = CsvLoader::loadContacts("phonebook.csv", m_phoneBook);
        for (Contact* c : contacts)
            m_phoneBook->insertContactData(c);
    }
    setModel(m_phoneBook);
}

void ContactModelManager::createCallHistory()
{
    if (!m_callHistory) {
        m_callHistory = new CallHistory(this);
        QList<Contact*> contacts = CsvLoader::loadContacts("callhistory.csv", m_callHistory);
        for (Contact* c : contacts)
            m_callHistory->insertContactData(c);
    }
    setModel(m_callHistory);
}

void ContactModelManager::createWhatsApp()
{
    if (!m_whatsApp) {
        m_whatsApp = new WhatsApp(this);
        QList<Contact*> contacts = CsvLoader::loadContacts("whatsapp.csv", m_whatsApp);
        for (Contact* c : contacts)
            m_whatsApp->insertContactData(c);
    }
    setModel(m_whatsApp);
}

void ContactModelManager::addContact(const QString &name,
                                     const QString &number,
                                     const QString &image,
                                     const QString &callTime,
                                     bool isIncoming,
                                     bool isOutgoing,
                                     const QString &shortMessage)
{
    if (!m_phoneBook) createPhoneBook();
    if (!m_phoneBook) return;

    Contact* prototype = new Contact(name, number, image,
                                     callTime,
                                     isIncoming, isOutgoing,
                                     shortMessage, nullptr);

    m_phoneBook->insertContactData(prototype);
    setModel(m_phoneBook);
}

void ContactModelManager::addCallHistoryEntry(const QString &name,
                                              const QString &number,
                                              const QString &image,
                                              bool isIncoming,
                                              bool isOutgoing,
                                              const QString &shortMessage)
{
    if (!m_callHistory) {
        m_callHistory = new CallHistory(this);
        QList<Contact*> contacts = CsvLoader::loadContacts("callhistory.csv", m_callHistory);
        for (Contact* c : contacts)
            m_callHistory->insertContactData(c);
    }

    QString callTime = QDateTime::currentDateTime().toString("dd MMM yyyy hh:mm AP");

    Contact* prototype = new Contact(name, number, image,
                                     callTime,
                                     isIncoming, isOutgoing,
                                     shortMessage, nullptr);

    m_callHistory->insertContactData(prototype);
    setModel(m_callHistory);
}

void ContactModelManager::removeContact(int index)
{
    if (!m_contactModel) return;
    m_contactModel->removeAt(index);
}

void ContactModelManager::updateContact(int index,
                                        const QString &name,
                                        const QString &number,
                                        const QString &image)
{
    if (!m_contactModel) return;
    m_contactModel->updateAt(index, name, number, image);
}
