#ifndef PERSONEL_H
#define PERSONEL_H

#include <QObject>
#include "user.h"

class Personel : public QObject , public User
{
    Q_OBJECT
    Q_PROPERTY(QString adsoyad READ adSoyad)
    Q_PROPERTY(QString statu READ statu)
    Q_PROPERTY(QString birimi READ birimi)


public:
    explicit Personel( QObject *parent = nullptr);

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
