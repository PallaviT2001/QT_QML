#ifndef PHONEBOOK_H
#define PHONEBOOK_H
#include "ContactDataModel.h"
#include <QDebug>

class PhoneBook : public ContactDataModel
{
    Q_OBJECT
public:
    explicit PhoneBook(QObject *parent = nullptr);
    ~PhoneBook();
};

#endif
