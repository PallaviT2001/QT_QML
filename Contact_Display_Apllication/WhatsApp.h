#ifndef WHATSAPP_H
#define WHATSAPP_H
#include "ContactDataModel.h"
#include <QDebug>

class WhatsApp: public ContactDataModel
{
    Q_OBJECT
public:
    explicit WhatsApp(QObject *parent = nullptr);
    ~WhatsApp();
};

#endif
