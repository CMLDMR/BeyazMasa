#include "smsmanager.h"


SMSManager::SMSManager(DataBase *_db) : SerikBLDCore::SMSAbstractManager (_db)
{

}

SMSManager::SMSManager(const DataBase *_db) : SerikBLDCore::SMSAbstractManager (_db)
{

}

SMSManager::SMSManager(const SMSManager &other) : SerikBLDCore::SMSAbstractManager (other.getDB ())
{

}

SMSManager::SMSManager(SMSManager &&other) : SerikBLDCore::SMSAbstractManager (other.getDB ())
{

}

SMSManager &SMSManager::operator=(const SMSManager &other)
{
    return *this;
}

SMSManager &SMSManager::operator=(SMSManager &&other)
{
    return other;
}


SerikBLDCore::SMS::SMSItem &SMSManager::insertAndSendSMS(const SerikBLDCore::SMS::SMSItem &item)
{
    return SerikBLDCore::SMS::SMSItem().setSMS ("ddd");
}

void SMSManager::insertSendSMS( const SMSObject *item)
{
    std::cout << *item << std::endl;
}
