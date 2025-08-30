#include "CallHistory.h"

CallHistory::CallHistory(QObject *parent):
    ContactDataModel(parent)
{
    qDebug() << "Callhistory class constructor called";
}

CallHistory::~CallHistory()
{
    qDebug() << "Callhistory class destructor called";
}


