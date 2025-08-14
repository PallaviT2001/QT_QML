#ifndef STUDENTMANAGER_H
#define STUDENTMANAGER_H

#include <QAbstractListModel>
#include <QList>
#include "Student.h"

class StudentManager : public QAbstractListModel
{
    Q_OBJECT
public:
    enum Roles {
        StudentNameRole = Qt::UserRole + 1,
        PhoneNumberRole,
        EmailRole,
        FatherNameRole,
        UserNameRole,
        PasswordRole
    };

    explicit StudentManager(QObject *parent = nullptr);
    ~StudentManager();

    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

    bool addStudent(const QString &studentName,
                    const QString &phoneNumber,
                    const QString &fatherName,
                    const QString &email,
                    const QString &password,
                    const QString &confirmPassword);

    bool checkLoginInfo(const QString &email, const QString &password);

private:
    QList<Student*> m_students;
};

#endif // STUDENTMANAGER_H
