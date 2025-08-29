#include "PhoneBook.h"

PhoneBook::PhoneBook(QObject *parent)
    : ContactDataModel(parent)
{
    qDebug() << "PhoneBook class constructor called";
}

PhoneBook::~PhoneBook()
{
    qDebug() << "PhoneBook class destructor called";
}
