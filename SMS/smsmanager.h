#ifndef SMSMANAGER_H
#define SMSMANAGER_H

#include "sms/smsabstrackmanager.h"
#include "Comman/database.h"
#include "Comman/managerpage.h"
#include <QObject>
#include "smsobject.h"
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>


class SMSManager : public QObject , public SerikBLDCore::SMSAbstractManager
{
    Q_OBJECT

    QNetworkAccessManager* mNetworkAccessManager;
    bool mSMSGonderiliyor;
public:
    SMSManager(DataBase *_db = nullptr );
    SMSManager(const DataBase *_db );
    SMSManager( const SMSManager& other );
    SMSManager( SMSManager&& other );

    SMSManager& operator=( const SMSManager& other );
    SMSManager& operator=( SMSManager&& other );


    bool insertAndSendSMS(const SerikBLDCore::SMS::SMSItem &item) override;

    Q_INVOKABLE bool insertSendSMS(const SMSObject *item );


signals:
    void notify(QString notifyMSG);
};

Q_DECLARE_METATYPE(SMSManager)

#endif // SMSMANAGER_H
