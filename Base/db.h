#ifndef DB_H
#define DB_H

#include "mongoheaders.h"
#include "../url.h"
#include <iostream>
#include <QString>

class DB
{
public:
    explicit DB();
    DB(mongocxx::database* _db);
    DB(DB* _db);

    mongocxx::database* db();

    QString downloadFile(const QString &fileOid , bool forceFilename = false);

    bsoncxx::types::value uploadfile(QString filepath );

private:
    mongocxx::database* mDB;




private:
    mongocxx::database _mDB;
    mongocxx::client* mClient;
};

#endif // DB_H
