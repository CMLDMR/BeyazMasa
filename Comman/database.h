#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include "db.h"

class DataBase : public QObject , public DB
{
    Q_OBJECT
public:
    explicit DataBase(QObject *parent = nullptr);
    DataBase( const DataBase &db );

signals:

public slots:
};

Q_DECLARE_METATYPE(DataBase)


#endif // DATABASE_H
