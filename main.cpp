#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Comman/backend.h"
#include "Comman/database.h"

#include "../url.h"
#include "mongocxx/instance.hpp"

#include "item.h"
#include "db.h"
#include "Login/puser.h"
#include "Dilekce/dilekcegirispage.h"
#include "TC/tcitem.h"
#include "Dilekce/dilekceitem.h"
#include "Dilekce/dilekcemanagerpage.h"
#include "TC/tcmanagerpage.h"
#include "Talep/talepmanagerpage.h"
#include "Talep/talepitem.h"
#include "Talep/talepevent.h"
#include "SMS/smsmanager.h"
#include "SMS/smsobject.h"
#include "BilgiEdinme/bilgiedinmemanagerpage.h"



void RegisterType();



int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);


    mongocxx::instance ins{};


    mongocxx::client* mClient;
    try {
        mClient = new mongocxx::client(mongocxx::uri(_url));
    } catch (mongocxx::exception &e) {
        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
        std::cout << str << std::endl;
    }

    auto _db = mClient->database (DB__);

    auto __mDBbase =new SerikBLDCore::DB(&_db);


    auto db = DataBase::createDataBase (__mDBbase);
    auto backend = new Backend(db);
    auto user = new PUser(db);

    RegisterType ();

    QGuiApplication app(argc, argv);

    app.setOrganizationName("Serik Belediyesi");
    app.setOrganizationDomain("www.serik.bel.tr");
    app.setApplicationName("Beyaz MASA");

    QQmlApplicationEngine engine;

    engine.rootContext ()->setContextProperty ("Backend",backend);
    engine.rootContext ()->setContextProperty ("User",user);
    engine.rootContext ()->setContextProperty ("DB",db);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);


    return app.exec();
}



void RegisterType(){

    qmlRegisterType <DataBase>();
    qmlRegisterType <DilekceGirisPage>("serik.bel.tr.DilekceGirisPage",1,0,"DilekceGirisBackend");
    qmlRegisterType <DilekceItem>("serik.bel.tr.DilekceItem",1,0,"DilekceItem");
    qmlRegisterType <TCItem>("serik.bel.tr.TCItem",1,0,"TCItem");
    qmlRegisterType <DilekceManagerPage>("serik.bel.tr.DilekceManagerPage",1,0,"DilekceManagerPage");
    qmlRegisterType <TCManagerPage>("serik.bel.tr.TCManagerPage",1,0,"TCManagerPage");
    qmlRegisterType <TCManagerPageV2>("serik.bel.tr.TCManagerPageV2",1,0,"TCManagerPageV2");

    qmlRegisterType <TalepItem>("serik.bel.tr.TalepItem",1,0,"TalepItem");
    qmlRegisterType <TalepEvent>("serik.bel.tr.TalepEvent",1,0,"TalepEvent");
    qmlRegisterType <TalepManagerPage>("serik.bel.tr.TalepManagerPage",1,0,"TalepManagerPage");


    qmlRegisterType <SMSManager>("serik.bel.tr.SMSManager",1,0,"SMSManager");
    qRegisterMetaType<SMSObject*>("const SMSObject*");
    qmlRegisterType <SMSObject>("serik.bel.tr.SMSObject",1,0,"SMSObject");


    qmlRegisterType <BilgiEdinmeManagerPage>("serik.bel.tr.BilgiEdinmeManagerPage",1,0,"BilgiEdinmeManagerPage");
    qmlRegisterType <BilgiEdinmeValue>("serik.bel.tr.BilgiEdinmeValue",1,0,"BilgiEdinmeValue");



}
