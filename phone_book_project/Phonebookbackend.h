#ifndef PHONEBOOKBACKEND_H
#define PHONEBOOKBACKEND_H

#include <QObject>

class Phonebookbackend : public QObject
{
    Q_OBJECT
public:
    explicit Phonebookbackend(QObject *parent = nullptr);

signals:
};

#endif // PHONEBOOKBACKEND_H
