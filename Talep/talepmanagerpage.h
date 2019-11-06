#ifndef TALEPMANAGERPAGE_H
#define TALEPMANAGERPAGE_H

#include <QObject>
#include "Talep/talepmanager.h"
#include "Comman/database.h"
#include <QJsonObject>
#include <QQmlListProperty>
#include <QJsonArray>
#include "talepitem.h"

class TalepManagerPage : public QObject , public TalepManager
{
    Q_OBJECT
public:
    explicit TalepManagerPage(QObject *parent = nullptr);
    TalepManagerPage(DataBase* _db);


    Q_INVOKABLE bool insertTalepItem( TalepItem* item );

signals:

public slots:
};

#endif // TALEPMANAGERPAGE_H
