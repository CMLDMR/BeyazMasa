#include "backend.h"
#include <QDate>
#include <QUrl>
#include <QRandomGenerator>


Backend::Backend(DataBase *_db, QObject *parent) : QObject(parent) , mDB(_db)
{
    mCurrentMode = Large;
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

BilgiEdinmeManagerPage *Backend::createBilgiEdinmeManager()
{
    return new BilgiEdinmeManagerPage(this->mDB);
}

QString Backend::localFileUrl(const QString &filePath)
{
    return QUrl::fromLocalFile (filePath).toString ();
}

int Backend::bootWidth() const
{
    return mBootWidth;
}

void Backend::setBootWidth(int bootWidth)
{
    mBootWidth = bootWidth;
    if( mBootWidth < 480 )
    {
        mCurrentMode = ExtraSmall;
    }else if( mBootWidth < 768 )
    {
        mCurrentMode = Small;
    }else if( mBootWidth < 990 )
    {
        mCurrentMode = Medium;
    }else if( mBootWidth < 1368 )
    {
        mCurrentMode = Large;
    }else{
        mCurrentMode = ExtraLarge;
    }
    emit onScreenType();
}



int Backend::itemWidth(const qreal width, const int &extralargecol, const int &largecol, const int &mediumcol, const int &smallcol , const int &extraSmallcol)
{

    switch (mCurrentMode) {
    case ExtraSmall:
        return static_cast<int>(width / 12.0 * extraSmallcol);
    case Small:
        return static_cast<int>(width / 12.0 * smallcol);
    case Medium:
        return static_cast<int>(width / 12.0 * mediumcol);
    case Large:
        return static_cast<int>(width / 12.0 * largecol);
    case ExtraLarge:
        return static_cast<int>(width / 12.0 * extralargecol);
    default:
        break;
    }
    return static_cast<int>(width);
}

QString Backend::screenType() const
{
    QString returnStr = "NONESCREEN";
    switch (mCurrentMode) {
    case ExtraSmall:
        returnStr = "ExtraSmall";
        break;
    case Small:
        returnStr = "Small";
        break;
    case Medium:
        returnStr = "Medium";
        break;
    case Large:
        returnStr = "Large";
        break;
    case ExtraLarge:
        returnStr = "ExtraLarge";
    break;
    default:

        break;
    }
    return returnStr;
}

