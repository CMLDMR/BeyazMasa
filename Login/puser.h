#ifndef PUSER_H
#define PPUSER_H

#include <QObject>
#include "user.h"
#include "Comman/database.h"

class PUser : public QObject , public SerikBLDCore::User
{
    Q_OBJECT
    Q_PROPERTY(QString adsoyad READ adSoyad NOTIFY logined )
    Q_PROPERTY(QString statu READ statu NOTIFY logined )
    Q_PROPERTY(QString birimi READ birimi NOTIFY logined )
    Q_PROPERTY(QString UserOid READ UserOid NOTIFY logined )
    Q_PROPERTY(QString photoURL READ photoURL NOTIFY logined )


public:
    explicit PUser( QObject *parent = nullptr);
    PUser( DataBase* _db );

    Q_INVOKABLE bool login( const QString &_mTel ,const QString &_mPassword );

    QString photoURL();

    QString adSoyad();
    QString statu();
    QString birimi();


signals:
    void logined();

public slots:
};

#endif // PERSONEL_H
