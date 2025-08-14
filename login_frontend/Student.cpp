#include "Student.h"
#include <qdebug.h>

Student::Student(QObject *parent)
    : QObject{parent}
{
    qDebug()<<Q_FUNC_INFO;
    connect(this,&Student::userNameChanged,this,&Student::onUserNameChanged);
    connect(this,&Student::phoneNumberChanged,this,&Student::onPhoneNumberChanged);
    connect(this,&Student::fatherNameChanged,this,&Student::onFatherNameChanged);
    connect(this,&Student::emailChanged,this,&Student::onEmailChanged);
    connect(this,&Student::passwordChanged,this,&Student::onPasswordChanged);
    connect(this,&Student::confirmPasswordChanged,this,&Student::onConfirmPasswordChanged);
}

Student::~Student()
{
    qDebug()<<Q_FUNC_INFO;
    for (Student* s : std::as_const(m_studentList)) {
        delete s;
    }
    m_studentList.clear();
}

QString Student::getUserName() const
{
    return m_userName;
}

void Student::setUserName(const QString &newUserName)
{

    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}

QString Student::getFatherName() const
{

    return m_fatherName;
}

void Student::setFatherName(const QString &newFatherName)
{

    if (m_fatherName == newFatherName)
        return;
    m_fatherName = newFatherName;
    emit fatherNameChanged();
}

QString Student::getPassword() const
{

    return m_password;
}

void Student::setPassword(const QString &newPassword)
{

    if (m_password == newPassword)
        return;
    m_password = newPassword;
    emit passwordChanged();
}

QString Student::getEmail() const
{

    return m_email;
}

void Student::setEmail(const QString &newEmail)
{

    if (m_email == newEmail)
        return;
    m_email = newEmail;
    emit emailChanged();
}

QString Student::getPhoneNumber() const
{

    return m_phoneNumber;
}

void Student::setPhoneNumber(QString newMobileNumber)
{

    if (newMobileNumber == newMobileNumber)
        return;
    newMobileNumber = newMobileNumber;
    emit phoneNumberChanged();
}


QString Student::getConfirmPassword() const
{

    return m_confirmPassword;
}

void Student::setConfirmPassword(const QString &newConfirmPassword)
{

    if (m_confirmPassword == newConfirmPassword)
        return;
    m_confirmPassword = newConfirmPassword;
    emit confirmPasswordChanged();
}


void Student::onUserNameChanged()
{
    qDebug()<<Q_FUNC_INFO<<"UserName: "<<m_userName;

}

void Student::onFatherNameChanged()
{
    qDebug()<<Q_FUNC_INFO<<"FatherName: "<<m_fatherName;

}


void Student::onPasswordChanged()
{
    qDebug()<<Q_FUNC_INFO<<"Password: "<<m_password;

}

void Student::onEmailChanged()
{
    qDebug()<<Q_FUNC_INFO<<"Email: "<<m_email;

}

void Student::onPhoneNumberChanged()
{
    qDebug()<<Q_FUNC_INFO<<"MobileNumber: "<<m_phoneNumber;

}

void Student::onConfirmPasswordChanged()
{
    qDebug()<<Q_FUNC_INFO<<"ConfirmPassword: "<<m_confirmPassword;
}


bool Student::addStudent(const QString &studentName, const QString &phoneNumber, const QString &fatherName, const QString &email, const QString &password, const QString &confirmPassword)
{
    qDebug()<<Q_FUNC_INFO;

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

    Student* newStudent = new Student(this);
    newStudent->setUserName(studentName);
    newStudent->setPhoneNumber(phoneNumber);
    newStudent->setFatherName(fatherName);
    newStudent->setEmail(email);
    newStudent->setPassword(password);
    newStudent->setConfirmPassword(confirmPassword);

    m_studentList.append(newStudent);

    emit registrationSuccess();
    qDebug() << "Student added successfully:" << m_studentList.size();
    return true;
}

bool Student::checkLoginInfo(const QString &email, const QString &password)
{
    qDebug()<<Q_FUNC_INFO;

    for (Student* s : std::as_const(m_studentList)) {
        if(s->m_email == email && s->m_password == password){
            qDebug() << "Login Successfull.";
            emit loginSuccess();
            return true;
        }
    }
    qDebug() << "Login failed or Invalid User";
    return false;
}
