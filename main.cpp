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

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    mongocxx::instance ins{};

    auto db = new DataBase();
    auto backend = new Backend(db);
    auto user = new PUser(db);

    qmlRegisterType<DataBase>();
    qmlRegisterType <DilekceGirisPage>("serik.bel.tr.DilekceGirisPage",1,0,"DilekceGirisBackend");
    qmlRegisterType <DilekceItem>("serik.bel.tr.DilekceItem",1,0,"DilekceItem");
    qmlRegisterType <TCItem>("serik.bel.tr.TCItem",1,0,"TCItem");
    qmlRegisterType <DilekceManagerPage>("serik.bel.tr.DilekceManagerPage",1,0,"DilekceManagerPage");
    qmlRegisterType <TCManagerPage>("serik.bel.tr.TCManagerPage",1,0,"TCManagerPage");

    qmlRegisterType <TalepItem>("serik.bel.tr.TalepItem",1,0,"TalepItem");
    qmlRegisterType <TalepManagerPage>("serik.bel.tr.TalepManagerPage",1,0,"TalepManagerPage");

//    qmlRegisterInterface<QList<DilekceItem*>>("DilekceItemList");

//    auto testDoc = document{};

//    try {
//        testDoc.append (kvp("_id",bsoncxx::oid{"5db2b6249193561f30008296"}));
//    } catch (bsoncxx::exception &e) {
//        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
//        std::cout << str << std::endl;
//    }

//    try {
//        testDoc.append (kvp("int64",bsoncxx::types::b_int64{20191012121212321}));
//    } catch (bsoncxx::exception &e) {
//        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
//        std::cout << str << std::endl;
//    }

//    try {
//        testDoc.append (kvp("int32",bsoncxx::types::b_int32{234}));
//    } catch (bsoncxx::exception &e) {
//        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
//        std::cout << str << std::endl;
//    }

//    try {
//        testDoc.append (kvp("utf8",bsoncxx::types::b_utf8{"234"}));
//    } catch (bsoncxx::exception &e) {
//        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
//        std::cout << str << std::endl;
//    }


///*
// *  binary_sub_type sub_type;
//    uint32_t size;
//    const uint8_t* bytes;
//*/


//    QByteArray ar("CEMALDEMIR");
//    std::cout << (const uint8_t*)(ar.data ()) << std::endl;

//    try {
//        testDoc.append (kvp("binary",bsoncxx::types::b_binary {bsoncxx::binary_sub_type::k_binary,static_cast<uint32_t>(ar.size ()),(const uint8_t*)(ar.data ())}));
//    } catch (bsoncxx::exception &e) {
//        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
//        std::cout << str << std::endl;
//    }

//    std::cout << bsoncxx::to_json (testDoc.view ()) << std::endl;



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
