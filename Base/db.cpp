#include "db.h"

DB::DB()
{

    try {
        mClient = new mongocxx::client(mongocxx::uri(_url));
    } catch (mongocxx::exception &e) {
        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
        std::cout << str << std::endl;
    }

    _mDB = mClient->database (DB__);

    this->mDB = &_mDB;
}

DB::DB(mongocxx::database *_db)
    :mDB(_db)
{

}

DB::DB(DB *_db)
    :mDB(_db->db ())
{

}

mongocxx::database *DB::db()
{
    return this->mDB;
}
