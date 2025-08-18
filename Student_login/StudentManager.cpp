#include "StudentManager.h"
#include <QDebug>

StudentManager::StudentManager()
{
    qDebug() << Q_FUNC_INFO;
}

StudentManager::~StudentManager()
{
    qDebug() << Q_FUNC_INFO;
    for (student* s : std::as_const(m_studentList)) {
        delete s;
    }
    m_studentList.clear();
}

bool StudentManager::addStudent(const QString &studentName, const QString &phoneNumber,
                                const QString &fatherName, const QString &email,
                                const QString &password, const QString &confirmPassword)
{
    qDebug() << Q_FUNC_INFO;

    // --- Validation ---
    if (studentName.isEmpty() || phoneNumber.isEmpty() || fatherName.isEmpty() || email.isEmpty() ||
        password.isEmpty() || confirmPassword.isEmpty()) {
        qDebug() << "No Empty Fields are Allowed";
        return false;
    }

    if (password.length() < 8) {
        qDebug() << "Password must be at least 8 characters long";
        return false;
    }

    if (password != confirmPassword) {
        qDebug() << "Passwords do not match";
        return false;
    }

    // --- Store actual user input instead of hardcoded data ---
    student* newStudent = new student(this);
    newStudent->setUserName(studentName);
    newStudent->setPhoneNumber(phoneNumber);
    newStudent->setFatherName(fatherName);
    newStudent->setEmail(email);
    newStudent->setPassword(password);
    newStudent->setConfirmPassword(confirmPassword);

    beginInsertRows(QModelIndex(), m_studentList.size(), m_studentList.size());
    m_studentList.append(newStudent);
    endInsertRows();

    emit registrationSuccess();
    qDebug() << "Student added. Total students:" << m_studentList.size();
    return true;
}

bool StudentManager::checkLoginInfo(const QString &email, const QString &password)
{
    qDebug() << Q_FUNC_INFO;

    for (student* s : std::as_const(m_studentList)) {
        qDebug() << "Checking:" << s->getEmail() << s->getPassword();
        if (s->getEmail() == email && s->getPassword() == password) {
            qDebug() << "Login Successful.";
            emit loginSuccess();
            return true;
        }
    }
    qDebug() << "Login failed or Invalid User";
    return false;
}

int StudentManager::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return m_studentList.size();
}

QVariant StudentManager::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || index.row() >= m_studentList.size())
        return QVariant();

    const student* s = m_studentList.at(index.row());

    switch (role) {
    case USER_NAME:
        return s->getUserName();
    case PHONE_NUMBER:
        return s->getPhoneNumber();
    case FATHER_NAME:
        return s->getFatherName();
    case EMAIL:
        return s->getEmail();
    case PASSWORD:
        return s->getPassword();
    case CONFIRM_PASSWORD:
        return s->getConfirmPassword();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> StudentManager::roleNames() const
{
    QHash<int, QByteArray> l_roleNames;
    l_roleNames.insert(USER_NAME, "userName");
    l_roleNames.insert(PHONE_NUMBER, "phoneNumber");
    l_roleNames.insert(FATHER_NAME, "fatherName");
    l_roleNames.insert(EMAIL, "email");
    l_roleNames.insert(PASSWORD, "password");
    l_roleNames.insert(CONFIRM_PASSWORD, "confirmPassword");
    return l_roleNames;
}
