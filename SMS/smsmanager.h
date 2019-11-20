#ifndef SMSMANAGER_H
#define SMSMANAGER_H

#include "sms/smsabstrackmanager.h"
#include "Comman/database.h"
#include "Comman/managerpage.h"
#include <QObject>
#include "smsobject.h"

class SMSManager : public QObject , public SerikBLDCore::SMSAbstractManager
{
    Q_OBJECT
public:
//    explicit SMSManager(QObject *parent = nullptr);
    SMSManager(DataBase *_db = nullptr );
    SMSManager(const DataBase *_db );
    SMSManager( const SMSManager& other );
    SMSManager( SMSManager&& other );

    SMSManager& operator=( const SMSManager& other );
    SMSManager& operator=( SMSManager&& other );


    SerikBLDCore::SMS::SMSItem & insertAndSendSMS(const SerikBLDCore::SMS::SMSItem &item) override;

    Q_INVOKABLE void insertSendSMS(const SMSObject *item );
};

Q_DECLARE_METATYPE(SMSManager)

#endif // SMSMANAGER_H
