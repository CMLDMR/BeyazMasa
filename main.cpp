#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Comman/backend.h"

#include "../url.h"
#include "mongocxx/instance.hpp"

#include "item.h"
#include "db.h"
#include "Login/personel.h"
#include "Dilekce/dilekcegirispage.h"
#include "TC/tcitem.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    mongocxx::instance ins{};

    auto db = new DB();

    auto user =new Personel();

    qmlRegisterType <DilekceGirisPage>("serik.bel.tr.DilekceGirisPage",1,0,"DilekceGirisBackend");
    qmlRegisterType <YeniDilekce>("serik.bel.tr.YeniDilekce",1,0,"YeniDilekce");
    qmlRegisterType <TCItem>("serik.bel.tr.TCItem",1,0,"TCItem");


    QGuiApplication app(argc, argv);

    app.setOrganizationName("Serik Belediyesi");
    app.setOrganizationDomain("www.serik.bel.tr");
    app.setApplicationName("Beyaz MASA");

    QQmlApplicationEngine engine;

    engine.rootContext ()->setContextProperty ("Backend",new Backend(db));
    engine.rootContext ()->setContextProperty ("User",user);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);


    return app.exec();
}
