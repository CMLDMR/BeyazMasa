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
#include "talepevent.h"
#include "tcmanager.h"

class TalepManagerPage : public ManagerPage<TalepItem> , public SerikBLDCore::TalepManager
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<TalepItem> list READ list NOTIFY listChanged )
    Q_PROPERTY(QQmlListProperty<TalepEvent> eventList READ eventList NOTIFY eventListUpdated )



public:
    explicit TalepManagerPage(QObject *parent = nullptr);
    TalepManagerPage(DataBase* _db);

    Q_INVOKABLE bool insertTalepItem( TalepItem* item );

    Q_INVOKABLE bool updateTalepItem( TalepItem* item );

    Q_INVOKABLE void find();

    Q_INVOKABLE void find( const int& limit , const int &skip );

    Q_INVOKABLE void find( const QString& tcno );

    Q_INVOKABLE int talepCount() ;

    Q_INVOKABLE int talepCount( const QString& tcno ) ;


    Q_INVOKABLE TalepItem *findOne( const QString &talepOid );

    Q_INVOKABLE bool insertTalepEvent(TalepEvent *event );

    QQmlListProperty<TalepEvent> eventList();

    Q_INVOKABLE void updateEventList( const QString& talepOid );

    Q_INVOKABLE QString uploadFile( const QString& fileUrl );

    Q_INVOKABLE QString downloadFileUrl( const QString& fileOid );




signals:
    void eventListUpdated();

private:
    QList<TalepEvent*> mEventList_Ptr;

    SerikBLDCore::TCManager* mTCManager;

};

#endif // TALEPMANAGERPAGE_H
