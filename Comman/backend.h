#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include "db.h"
#include <QJsonArray>
#include "Dilekce/dilekcemanagerpage.h"
#include "TC/tcmanagerpage.h"
#include "Talep/talepmanagerpage.h"
#include "BilgiEdinme/bilgiedinmemanagerpage.h"
#include "SMS/smsmanager.h"
#include <QScreen>
#include <QGuiApplication>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)
    Q_PROPERTY(QJsonArray mahalleler READ mahalleler )
    Q_PROPERTY(QJsonArray birimler READ birimler )
    Q_PROPERTY (int currentJulianDay READ currentJulianDay )
    Q_PROPERTY (int mSecStartOfDay READ mSecStartOfDay )
    Q_PROPERTY (int currentYil READ currentYil )
    Q_PROPERTY (QString currentAy READ currentAy )
    Q_PROPERTY (int BootWidth READ bootWidth WRITE setBootWidth )
    Q_PROPERTY (QString screenType READ screenType NOTIFY onScreenType )
public:
    explicit Backend(DataBase* _db , QObject *parent = nullptr);

    QString message() const;
    void setMessage(const QString &message);



    QJsonArray mahalleler() const;
    QJsonArray birimler() const;

    int currentJulianDay();
    int mSecStartOfDay();
    int currentYil() const;
    QString currentAy() const;

    Q_INVOKABLE DilekceManagerPage* createDilekceManager();
    Q_INVOKABLE TCManagerPage* createTCManager();
    Q_INVOKABLE TalepManagerPage* createTalepManager();
    Q_INVOKABLE SMSManager* createSMSManager();
    Q_INVOKABLE BilgiEdinmeManagerPage* createBilgiEdinmeManager();


    Q_INVOKABLE QString localFileUrl( const QString &filePath );


    // TODO: Bootstrap 3 ScreenMode Uygulanacak.
    int bootWidth() const;
    void setBootWidth(int bootWidth);
    enum CurrentScreen{
        ExtraSmall,
        Small,
        Medium,
        Large,
        ExtraLarge
    };
    Q_ENUMS(CurrentScreen)
    CurrentScreen mCurrentMode;
    Q_INVOKABLE int itemWidth(const qreal width ,
                                const int &extralargecol = 2 ,
                                const int &largecol = 3,
                                const int &mediumcol = 4,
                                const int &smallcol = 6,
                                const int &extraSmallcol = 12);

    QString screenType() const;



signals:
    void messageChanged(QString _message);
    void onScreenType();
public slots:


private:
    QString mMessage;

    DataBase* mDB;

    int mBootWidth;
};

#endif // BACKEND_H
