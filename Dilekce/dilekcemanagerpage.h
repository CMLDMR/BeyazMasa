#ifndef DILEKCEMANAGERPAGE_H
#define DILEKCEMANAGERPAGE_H

#include <QObject>
#include "dilekcemanager.h"
#include "dilekceitem.h"
#include <QQmlListProperty>
#include "Comman/database.h"
#include "dilekcecevap.h"
#include "dilekceaciklama.h"
#include <QJsonObject>


class DilekceManagerPage : public QObject , public SerikBLDCore::DilekceManager
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<DilekceItem> dilekceList READ dilekceList NOTIFY dilekceListChanged )
    Q_PROPERTY ( QStringList kategoriList READ Kategorilist NOTIFY kategorilistChanged )

public:
    explicit DilekceManagerPage(QObject *parent = nullptr);
    explicit DilekceManagerPage(DataBase *db);
    DilekceManagerPage(const DilekceManagerPage &other);

    QQmlListProperty<DilekceItem> dilekceList();
    Q_INVOKABLE void dilekceListByTelefon( const QString &telefon);
    Q_INVOKABLE void dilekceListByTCNO( const QString &tcno);
    Q_INVOKABLE void dilekceListBySayi( const int &sayi );
    Q_INVOKABLE QString downloadFilePath( const QString &fileOid );

    QList<DilekceItem> mDilekceItemlist;



    Q_INVOKABLE DilekceItem* loadByOid( const QString &moid );

    Q_INVOKABLE QJsonArray ekFilePathList(QVariant dilekceItem);
    Q_INVOKABLE QJsonArray gorevliList( DilekceItem* item );
    Q_INVOKABLE QJsonArray aciklamalar( DilekceItem* item );
    Q_INVOKABLE QJsonObject cevap( DilekceItem* item );
    Q_INVOKABLE QJsonArray cevapEkList( QJsonArray oidList );

    Q_INVOKABLE bool saveDilekce(DilekceItem *_item );



    Q_INVOKABLE bool updateDilekce(DilekceItem *dilekce);

    Q_INVOKABLE bool insertYeniKategori(const QString &yeniKategori) override;
    Q_INVOKABLE bool deleteKategori(const QString &kategoriName) override;


signals:
    void dilekceListChanged();
    void kategorilistChanged();


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
