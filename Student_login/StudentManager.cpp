#include "StudentManager.h"

StudentManager::StudentManager()
{
    qDebug()<<Q_FUNC_INFO;
}

StudentManager::~StudentManager()
{
    qDebug()<<Q_FUNC_INFO;
    for (student* s : std::as_const(m_studentList)) {
        delete s;
    }
    m_studentList.clear();
}


bool StudentManager::addStudent(const QString &studentName, const QString &phoneNumber, const QString &fatherName, const QString &email, const QString &password, const QString &confirmPassword)
{
    qDebug()<<Q_FUNC_INFO;

    student* newStudent = new student(this);
    newStudent->setUserName("Pallavi t");
    newStudent->setPhoneNumber("8431664310");
    newStudent->setFatherName("Thippeswamy");
    newStudent->setEmail("pallavit8046@gmail.com");
    newStudent->setPassword("pallavi@2001");
    newStudent->setConfirmPassword("pallavi@2001");

    // if (studentName.isEmpty() || phoneNumber.isEmpty() || fatherName.isEmpty() || email.isEmpty() ||
    //     password.isEmpty() || confirmPassword.isEmpty()) {
    //     qDebug() << "No Empty Fields are Allowed";
    //     return false;
    // }

    // if (password.length() < 8) {
    //     qDebug() << "Password must be at least 8 characters long";
    //     return false;
    // }

    // if (password != confirmPassword) {
    //     qDebug() << "Passwords do not match";
    //     return false;
    // }

    // student* newStudent = new student(this);
    // newStudent->setUserName(studentName);
    // newStudent->setPhoneNumber(phoneNumber);
    // newStudent->setFatherName(fatherName);
    // newStudent->setEmail(email);
    // newStudent->setPassword(password);
    // newStudent->setConfirmPassword(confirmPassword);

    m_studentList.append(newStudent);

    emit registrationSuccess();
    qDebug() << "Student added Total students:" << m_studentList.size();
    return true;
}

bool StudentManager::checkLoginInfo(const QString &email, const QString &password)
{
    qDebug()<<Q_FUNC_INFO;

    for (student* s : std::as_const(m_studentList)) {
        if(s->getEmail() == email && s->getPassword() == password){
            qDebug() << "Login Successfull.";
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
    const student* student = m_studentList.at(index.row());

    switch (role) {
    case USER_NAME:
        return student->getUserName();
    case PHONE_NUMBER:
        return student->getPhoneNumber();
    case FATHER_NAME:
        return student->getFatherName();
    case EMAIL:
        return student->getEmail();
    case PASSWORD:
        return student->getPassword();
    case CONFIRM_PASSWORD:
        return student->getConfirmPassword();
    default:
        return QVariant();
    }
    return QVariant();
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
