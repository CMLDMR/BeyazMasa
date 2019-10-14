#ifndef DB_H
#define DB_H

#include "mongoheaders.h"
#include "../url.h"
#include <iostream>


class DB
{
public:
    explicit DB();
    DB(mongocxx::database* _db);
    DB(DB* _db);

    mongocxx::database* db();

private:
    mongocxx::database* mDB;




private:
    mongocxx::database _mDB;
    mongocxx::client* mClient;
};

#endif // DB_H
