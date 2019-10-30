#ifndef TCMANAGERPAGE_H
#define TCMANAGERPAGE_H

#include <QObject>
#include "tcmanager.h"
#include "Comman/database.h"
#include "tcitem.h"

class TCManagerPage : public QObject , public TCManager
{
    Q_OBJECT
public:
    explicit TCManagerPage(QObject *parent = nullptr);
    TCManagerPage(DataBase* _db );


    Q_INVOKABLE bool tcCheck( const QString& mTC );

    Q_INVOKABLE TCItem *loadByTC(const QString &mTCNO);

    Q_INVOKABLE TCItem* loadByTel( const QString &mTel );

signals:

public slots:
};

#endif // TCMANAGERPAGE_H
