#ifndef BILGIEDINMEMANAGERPAGE_H
#define BILGIEDINMEMANAGERPAGE_H

#include "bilgiEdinme/bilgiedinmemanager.h"
#include "Comman/managerpage.h"
#include "BilgiEdinme/bilgiedinmevalue.h"

class BilgiEdinmeManagerPage : public ManagerPage<BilgiEdinmeValue> , public SerikBLDCore::BilgiEdinme::BilgiEdinmeManager
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<BilgiEdinmeValue> list READ list NOTIFY listChanged )

public:
    explicit BilgiEdinmeManagerPage();
    BilgiEdinmeManagerPage(DB* db);

    Q_INVOKABLE BilgiEdinmeValue *valueAt( const QString &byOid );

    Q_INVOKABLE bool updateItem(BilgiEdinmeValue *item );

    Q_INVOKABLE void refreshList();
private:

    void _refreshList();

};


#endif // BILGIEDINMEMANAGERPAGE_H
