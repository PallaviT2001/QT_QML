#ifndef CONTACTMODELMANAGER_H
#define CONTACTMODELMANAGER_H
#include <QObject>
#include "ContactDataModel.h"

class PhoneBook;
class CallHistory;
class WhatsApp;

class ContactModelManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(ContactDataModel* contactModel READ contactModel NOTIFY contactModelChanged)

public:
    explicit ContactModelManager(QObject *parent = nullptr);
    ~ContactModelManager();

    Q_INVOKABLE void createPhoneBook();
    Q_INVOKABLE void createCallHistory();
    Q_INVOKABLE void createWhatsApp();

    Q_INVOKABLE void addContact(const QString &name,
                                const QString &number,
                                const QString &image,
                                const QString &callTime = QString(),
                                bool isIncoming = false,
                                bool isOutgoing = false,
                                const QString &shortMessage = QString());

    Q_INVOKABLE void addCallHistoryEntry(const QString &name,
                                         const QString &number,
                                         const QString &image = QString(),
                                         bool isIncoming = false,
                                         bool isOutgoing = true,
                                         const QString &shortMessage = QString());

    Q_INVOKABLE void removeContact(int index);
    Q_INVOKABLE void updateContact(int index,
                                   const QString &name,
                                   const QString &number,
                                   const QString &image);

    ContactDataModel* contactModel() const;

signals:
    void contactModelChanged();

private:
    ContactDataModel* m_contactModel;

    PhoneBook* m_phoneBook;
    CallHistory* m_callHistory;
    WhatsApp* m_whatsApp;

    void setModel(ContactDataModel* model);
};

#endif
