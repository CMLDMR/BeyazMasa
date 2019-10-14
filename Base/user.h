#ifndef USER_H
#define USER_H

#include "Base/item.h"
#include "Base/db.h"
#include <QObject>

class User : public QObject , public Item , public DB
{
    Q_OBJECT


    const std::string Collection{"Personel"};
    const QString KeyTel = "telefon";
    const QString KeyPassword = "password";

public:
    explicit User(DB* _db ,QObject *parent = nullptr);

    Q_INVOKABLE bool login( QString _mTel , QString _mPassword );

signals:
    void logined();

public slots:
};

#endif // USER_H
