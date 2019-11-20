#ifndef SMSOBJECT_H
#define SMSOBJECT_H

#include "sms/smsitem.h"
#include <QObject>

class SMSObject : public QObject , public SerikBLDCore::SMS::SMSItem
{
    Q_OBJECT
    Q_PROPERTY(QString smsText READ smsText WRITE setSMS )
public:
    SMSObject();
    SMSObject( const SMSObject& other );
    SMSObject( SMSObject&& other );

    SMSObject& operator=( const SMSObject& other );
    SMSObject& operator=( SMSObject&& other );
};

Q_DECLARE_METATYPE(SMSObject)

#endif // SMSOBJECT_H
