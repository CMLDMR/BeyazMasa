#ifndef PUSER_H
#define PPUSER_H

#include <QObject>
#include "user.h"
#include "Comman/database.h"

class PUser : public QObject , public User
{
    Q_OBJECT
    Q_PROPERTY(QString adsoyad READ adSoyad)
    Q_PROPERTY(QString statu READ statu)
    Q_PROPERTY(QString birimi READ birimi)
    Q_PROPERTY(QString UserOid READ UserOid)



public:
    explicit PUser( QObject *parent = nullptr);
    PUser( DataBase* _db );

    Q_INVOKABLE bool login( const QString &_mTel ,const QString &_mPassword );

    Q_INVOKABLE QString photoURL();

    QString adSoyad();
    QString statu();
    QString birimi();


signals:
    void logined();

public slots:
};

#endif // PERSONEL_H
