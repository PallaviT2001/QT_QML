#ifndef CONTACTDATAMODEL_H
#define CONTACTDATAMODEL_H
#include <QAbstractListModel>
#include "Contact.h"

class ContactDataModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum ContactRoles {
        NameRole = 1,
        NumberRole,
        ImageRole
    };
    explicit ContactDataModel(QObject *parent = nullptr);

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addContact(const QString &name, const QString &number, const QString &image);

private:
    QList<Contact*> m_contacts;
};

#endif
