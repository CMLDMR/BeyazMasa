#ifndef DILEKCEMANAGERPAGE_H
#define DILEKCEMANAGERPAGE_H

#include <QObject>
#include "dilekcemanager.h"
#include "dilekceitem.h"
#include <QQmlListProperty>
#include "Comman/database.h"


class DilekceManagerPage : public QObject , public DilekceManager
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<DilekceItem> dilekceList READ dilekceList NOTIFY dilekceListChanged )

public:
    explicit DilekceManagerPage(QObject *parent = nullptr);
    DilekceManagerPage(DataBase *db);
    DilekceManagerPage(const DilekceManagerPage &other);

    Q_INVOKABLE DilekceManagerPage* createManager(DataBase* db);

    QQmlListProperty<DilekceItem> dilekceList();
    Q_INVOKABLE void dilekceListByTelefon( const QString &telefon);
    Q_INVOKABLE void dilekceListByTCNO( const QString &tcno);
    Q_INVOKABLE void dilekceListBySayi( const int &sayi );

    QList<DilekceItem> mDilekceItemlist;





    Q_INVOKABLE bool saveDilekce(DilekceItem *_item );



signals:

    void dilekceListChanged();


public slots:

private:
    static void appendList(QQmlListProperty<DilekceItem> *property, DilekceItem *note);
    static DilekceItem* cardAt(QQmlListProperty<DilekceItem> *property, int index);
    static int listSize(QQmlListProperty<DilekceItem> *property);
    static void clearListPtr(QQmlListProperty<DilekceItem> *property);
};

Q_DECLARE_METATYPE(DilekceManagerPage)


//class Storage : public QObject , public DilekceManager
//{
//    Q_OBJECT
//    Q_PROPERTY(QQmlListProperty<DilekceItem> getList READ getList)

//public:
//    QQmlListProperty<DilekceItem> getList();
//    QList<DilekceItem> noteItems;
//private:
//    static void appendList(QQmlListProperty<DilekceItem> *property, DilekceItem *note);
//    static DilekceItem* cardAt(QQmlListProperty<DilekceItem> *property, int index);
//    static int listSize(QQmlListProperty<DilekceItem> *property);
//    static void clearListPtr(QQmlListProperty<DilekceItem> *property);
//};

#endif // DILEKCEMANAGERPAGE_H
