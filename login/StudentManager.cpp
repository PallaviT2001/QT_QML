#include "StudentManager.h"
#include <QDebug>

StudentManager::StudentManager(QObject *parent)
    : QAbstractListModel(parent)
{
    qDebug() << Q_FUNC_INFO;
}

StudentManager::~StudentManager()
{
    qDeleteAll(m_students);
    m_students.clear();
}

bool StudentManager::addStudent(const QString &studentName,
                                const QString &phoneNumber,
                                const QString &fatherName,
                                const QString &email,
                                const QString &password,
                                const QString &confirmPassword)
{
    beginInsertRows(QModelIndex(), m_students.size(), m_students.size());
    Student *stu = new Student();
    stu->setUserName(studentName);
    stu->setPhoneNumber(phoneNumber);
    stu->setFatherName(fatherName);
    stu->setEmail(email);
    stu->setPassword(password);
    stu->setConfirmPassword(confirmPassword);
    m_students.append(stu);
    endInsertRows();
    return true;
}

bool StudentManager::checkLoginInfo(const QString &email, const QString &password)
{
    for (auto stu : m_students) {
        if (stu->getEmail() == email && stu->getPassword() == password) {
            return true;
        }
    }
    return false;
}

int StudentManager::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_students.size();
}

QVariant StudentManager::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() < 0 || index.row() >= m_students.size())
        return QVariant();

    const Student *student = m_students.at(index.row());

    switch (role) {
    case StudentNameRole: return student->getUserName();
    case PhoneNumberRole: return student->getPhoneNumber();
    case EmailRole:       return student->getEmail();
    case FatherNameRole:  return student->getFatherName();
    case UserNameRole:    return student->getUserName();
    case PasswordRole:    return student->getPassword();
    default: return QVariant();
    }
}

QHash<int, QByteArray> StudentManager::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[StudentNameRole] = "studentName";
    roles[PhoneNumberRole] = "phoneNum";
    roles[EmailRole]       = "emailID";
    roles[FatherNameRole]  = "fatherName";
    roles[UserNameRole]    = "userName";
    roles[PasswordRole]    = "passWord";
    return roles;
}
