#ifndef CONTACTMODEL_H
#define CONTACTMODEL_H
#include <QAbstractListModel>
#include "Phonebook.h"

class ContactModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit ContactModel(QObject *parent = nullptr);
    ~ContactModel();

    enum ContactRoles {
        ContactNameRole = Qt::UserRole + 1,
        ContactNumberRole
    };

    // Mandatory overrides
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addContact(const QString &name, const QString &number);
    Q_INVOKABLE void addNumberButtonClicked();   // Demo function
    Q_INVOKABLE int getSize() const;

private:
    QList<Contact*> m_contactList;
};

#endif // CONTACTMODEL_H
