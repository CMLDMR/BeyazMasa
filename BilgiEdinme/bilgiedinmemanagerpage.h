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

private:

};


#endif // BILGIEDINMEMANAGERPAGE_H
