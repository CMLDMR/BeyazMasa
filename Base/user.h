#ifndef USER_H
#define USER_H

#include "Base/item.h"
#include "Base/db.h"
#include <QObject>

class User : public QObject , public Item , public DB
{
    Q_OBJECT

    Q_PROPERTY(QString adsoyad READ AdSoyad)
    Q_PROPERTY(QString statu READ Statu)
    Q_PROPERTY(QString birimi READ Birimi)


    const std::string Collection{"Personel"};
    const QString KeyTel = "telefon";
    const QString KeyPassword = "password";
    const QString KeyAdSoyad{"ad soyad"};
    const QString KeyStatu{"Statü"};
    const QString KeyBirimi{"Birimi"};
    const QString KeyFotoid{"fotooid"};

public:
    explicit User(DB* _db ,QObject *parent = nullptr);

    Q_INVOKABLE bool login( QString _mTel , QString _mPassword );

    Q_INVOKABLE QString photoURL( );

    QString AdSoyad();
    QString Statu();
    QString Birimi();
signals:
    void logined();

public slots:
};

#endif // USER_H
