#include "database.h"

DataBase::DataBase(QObject *parent) : QObject(parent) , DB()
{

}

DataBase::DataBase(const DataBase &db)
    :DB(db)
{

}
