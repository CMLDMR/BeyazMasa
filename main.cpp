#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "Comman/backend.h"

#include "../url.h"
#include "mongocxx/instance.hpp"

#include "Base/item.h"
#include "Base/db.h"
#include "Base/user.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    mongocxx::instance ins{};

    auto db = new DB();

    auto user =new User(db);


    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.rootContext ()->setContextProperty ("Backend",new Backend());
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
