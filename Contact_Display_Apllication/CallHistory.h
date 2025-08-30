#ifndef CALLHISTORY_H
#define CALLHISTORY_H
#include "ContactDataModel.h"
#include <QDebug>

class CallHistory:public ContactDataModel
{
public:
    explicit CallHistory(QObject *parent = nullptr);
    ~CallHistory();
};

#endif

