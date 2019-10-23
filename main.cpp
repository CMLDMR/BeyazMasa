#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Comman/backend.h"
#include "Comman/database.h"

#include "../url.h"
#include "mongocxx/instance.hpp"

#include "item.h"
#include "db.h"
#include "Login/personel.h"
#include "Dilekce/dilekcegirispage.h"
#include "TC/tcitem.h"
#include "Dilekce/dilekceitem.h"
#include "Dilekce/dilekcemanagerpage.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    mongocxx::instance ins{};

    auto db = new DataBase();
    auto backend = new Backend(db);
    auto user =new Personel();

    qmlRegisterType<DataBase>();
    qmlRegisterType <DilekceGirisPage>("serik.bel.tr.DilekceGirisPage",1,0,"DilekceGirisBackend");
    qmlRegisterType <DilekceItem>("serik.bel.tr.DilekceItem",1,0,"DilekceItem");
    qmlRegisterType <TCItem>("serik.bel.tr.TCItem",1,0,"TCItem");
    qmlRegisterType <DilekceManagerPage>("serik.bel.tr.DilekceManagerPage",1,0,"DilekceManagerPage");

//    qmlRegisterInterface<QList<DilekceItem*>>("DilekceItemList");



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
