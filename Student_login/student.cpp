#include "student.h"
#include <qdebug.h>

student::student(QObject *parent)
    : QObject{parent}
{
    qDebug()<<Q_FUNC_INFO;
    connect(this,&student::userNameChanged,this,&student::onUserNameChanged);
    connect(this,&student::phoneNumberChanged,this,&student::onPhoneNumberChanged);
    connect(this,&student::fatherNameChanged,this,&student::onFatherNameChanged);
    connect(this,&student::emailChanged,this,&student::onEmailChanged);
    connect(this,&student::passwordChanged,this,&student::onPasswordChanged);
    connect(this,&student::confirmPasswordChanged,this,&student::onConfirmPasswordChanged);
}

student::~student()
{
    // qDebug()<<Q_FUNC_INFO;
    // for (Student* s : std::as_const(m_studentList)) {
    //     delete s;
    // }
    // m_studentList.clear();
}

QString student::getUserName() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_userName;
}

void student::setUserName(const QString &newUserName)
{
    // qDebug()<<Q_FUNC_INFO;

    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}

QString student::getFatherName() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_fatherName;
}

void student::setFatherName(const QString &newFatherName)
{
    // qDebug()<<Q_FUNC_INFO;

    if (m_fatherName == newFatherName)
        return;
    m_fatherName = newFatherName;
    emit fatherNameChanged();
}

QString student::getPassword() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_password;
}

void student::setPassword(const QString &newPassword)
{
    // qDebug()<<Q_FUNC_INFO;

    if (m_password == newPassword)
        return;
    m_password = newPassword;
    emit passwordChanged();
}

QString student::getEmail() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_email;
}

void student::setEmail(const QString &newEmail)
{
    // qDebug()<<Q_FUNC_INFO;

    if (m_email == newEmail)
        return;
    m_email = newEmail;
    emit emailChanged();
}

QString student::getPhoneNumber() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_phoneNumber;
}

void student::setPhoneNumber(QString newMobileNumber)
{
    qDebug()<<Q_FUNC_INFO;

    if (m_phoneNumber == newMobileNumber)
        return;
    m_phoneNumber = newMobileNumber;
    emit phoneNumberChanged();
}


QString student::getConfirmPassword() const
{
    // qDebug()<<Q_FUNC_INFO;

    return m_confirmPassword;
}

void student::setConfirmPassword(const QString &newConfirmPassword)
{
    // qDebug()<<Q_FUNC_INFO;

    if (m_confirmPassword == newConfirmPassword)
        return;
    m_confirmPassword = newConfirmPassword;
    emit confirmPasswordChanged();
}


void student::onUserNameChanged()
{
    qDebug()<<Q_FUNC_INFO<<"UserName: "<<m_userName;

}

void student::onFatherNameChanged()
{
    qDebug()<<Q_FUNC_INFO<<"FatherName: "<<m_fatherName;

}


void student::onPasswordChanged()
{
    qDebug()<<Q_FUNC_INFO<<"Password: "<<m_password;

}

void student::onEmailChanged()
{
    qDebug()<<Q_FUNC_INFO<<"Email: "<<m_email;

}

void student::onPhoneNumberChanged()
{
    qDebug()<<Q_FUNC_INFO<<"MobileNumber: "<<m_phoneNumber;

}

void student::onConfirmPasswordChanged()
{
    qDebug()<<Q_FUNC_INFO<<"ConfirmPassword: "<<m_confirmPassword;
}
