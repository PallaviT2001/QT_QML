#include "WhatsApp.h"

WhatsApp::WhatsApp(QObject *parent)
    : ContactDataModel(parent)
{
    qDebug() << "PhoneBook class constructor called";
}

WhatsApp::~WhatsApp()
{
    qDebug() << "PhoneBook class destructor called";
}
