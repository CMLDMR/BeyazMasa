#ifndef TCMANAGERPAGE_H
#define TCMANAGERPAGE_H

#include <QObject>
#include "tcmanager.h"
#include "Comman/database.h"
#include "tcitem.h"

class TCManagerPage : public QObject , public SerikBLDCore::TCManager
{
    Q_OBJECT
public:
    explicit TCManagerPage(QObject *parent = nullptr);
    TCManagerPage(DataBase* _db );


    Q_INVOKABLE bool tcCheck( const QString& mTC );

    Q_INVOKABLE bool cepTelefonuCheck( const QString& mCepTelefonu );

    Q_INVOKABLE bool saveTCItem(TCItem *item );

    Q_INVOKABLE TCItem *loadByTC(const QString &mTCNO);

    Q_INVOKABLE TCItem* loadByTel( const QString &mTel );

    Q_INVOKABLE TCItem* loadByOid( const QString &mOid );

    Q_INVOKABLE QString generatePassword() const;

signals:

public slots:
};

#endif // TCMANAGERPAGE_H
