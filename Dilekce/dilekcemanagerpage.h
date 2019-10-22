#ifndef DILEKCEMANAGERPAGE_H
#define DILEKCEMANAGERPAGE_H

#include <QObject>
#include "dilekcemanager.h"
#include "dilekceitem.h"
#include <QQmlListProperty>


class DilekceManagerPage : public QObject , public DilekceManager
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<DilekceItem> dilekceList READ dilekceList NOTIFY dilekceListChanged )

public:
    explicit DilekceManagerPage(QObject *parent = nullptr);

    QQmlListProperty<DilekceItem> dilekceList();
    Q_INVOKABLE void dilekceListByTelefon( const QString &telefon);
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
