#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include "db.h"

class DataBase : public QObject , public SerikBLDCore::DB
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = nullptr);
    DataBase( const DataBase &db );


    static DataBase* createDataBase(SerikBLDCore::DB* _db ){
        return static_cast<DataBase*>(_db);
    }


signals:

public slots:
};

Q_DECLARE_METATYPE(DataBase)


#endif // DATABASE_H
