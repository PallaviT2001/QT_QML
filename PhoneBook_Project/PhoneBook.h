#ifndef PHONEBOOK_H
#define PHONEBOOK_H
#include <QObject>

class PhoneBook : public QObject
{
    Q_OBJECT
public:
    explicit PhoneBook(QObject *parent = nullptr);

signals:

};

#endif // PHONEBOOK_H
