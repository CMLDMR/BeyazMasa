#include "backend.h"
#include <QDate>
#include <QUrl>


Backend::Backend(DataBase *_db, QObject *parent) : QObject(parent) , mDB(_db)
{

}

QString Backend::message() const
{
    return mMessage;
}

void Backend::setMessage(const QString &message)
{
    mMessage = message;
    emit messageChanged (mMessage);
}

QJsonArray Backend::mahalleler() const
{

    QJsonArray array;

    auto filter = document{};

    try {
        auto cursor = this->mDB->db ()->collection ("Mahalleler").find (filter.view ());

        for( auto doc : cursor )
        {
            try {
                auto item = QString::fromStdString (doc["Mahalle"].get_utf8 ().value.to_string());
                array.append (item);
            } catch (bsoncxx::exception &e) {
                std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
                std::cout << str << std::endl;
            }
        }

    } catch (mongocxx::exception &e) {
        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
        std::cout << str << std::endl;
    }

    return array;


}

QJsonArray Backend::birimler() const
{
    QJsonArray array;

    auto filter = document{};

    try {
        auto cursor = this->mDB->db ()->collection ("Müdürlükler").find (filter.view ());

        for( auto doc : cursor )
        {
            try {
                auto item = QString::fromStdString (doc["Birim"].get_utf8 ().value.to_string());
                array.append (item);
            } catch (bsoncxx::exception &e) {
                std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
                std::cout << str << std::endl;
            }
        }

    } catch (mongocxx::exception &e) {
        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
        std::cout << str << std::endl;
    }

    return array;
}

int Backend::currentJulianDay()
{
    return QDate::currentDate ().toJulianDay ();
}

int Backend::mSecStartOfDay()
{
    return QTime::currentTime ().msecsSinceStartOfDay ();
}

int Backend::currentYil() const
{
    return QDate::currentDate ().year ();
}

QString Backend::currentAy() const
{
    return QDate::currentDate ().toString ("MMMM");
}

DilekceManagerPage *Backend::createDilekceManager()
{
    return new DilekceManagerPage(this->mDB);
}

TCManagerPage *Backend::createTCManager()
{
    return new TCManagerPage(this->mDB);
}

TalepManagerPage *Backend::createTalepManager()
{
    return new TalepManagerPage(this->mDB);
}

SMSManager *Backend::createSMSManager()
{
    return new SMSManager(this->mDB);
}

QString Backend::localFileUrl(const QString &filePath)
{
    return QUrl::fromLocalFile (filePath).toString ();
}
