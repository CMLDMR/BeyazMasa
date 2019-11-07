#ifndef TALEPMANAGERPAGE_H
#define TALEPMANAGERPAGE_H

#include <QObject>
#include "Talep/talepmanager.h"
#include "Comman/database.h"
#include <QJsonObject>
#include <QQmlListProperty>
#include <QJsonArray>
#include "talepitem.h"
#include "Comman/managerpage.h"

class TalepManagerPage : public ManagerPage<TalepItem> , public TalepManager
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<TalepItem> list READ list NOTIFY listChanged )

public:
    explicit TalepManagerPage(QObject *parent = nullptr);
    TalepManagerPage(DataBase* _db);

    Q_INVOKABLE bool insertTalepItem( TalepItem* item );

    Q_INVOKABLE void find();
};

#endif // TALEPMANAGERPAGE_H
