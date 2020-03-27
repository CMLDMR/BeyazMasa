#ifndef TALEPKATEOGORIMANAGERPAGE_H
#define TALEPKATEOGORIMANAGERPAGE_H

#include <QObject>
#include <QQmlListProperty>
#include "Comman/database.h"
#include "Talep/talepkategoriitem.h"
#include "Talep/talepkategorimanager.h"
#include "Comman/managerpage.h"



class TalepKateogoriManagerPage : public ManagerPage<TalepKategoriItem> , public SerikBLDCore::TalepKategoriManager
{
    Q_OBJECT

    Q_PROPERTY(QQmlListProperty<TalepKategoriItem> list READ list NOTIFY listChanged )

public:
    explicit TalepKateogoriManagerPage( QObject *parent = nullptr );

    explicit TalepKateogoriManagerPage( DataBase* _db );

    virtual void onList(const QVector<SerikBLDCore::TalepKategori> *mlist) override;

    Q_INVOKABLE void updateKategoriList();

    Q_INVOKABLE bool deleteOne( const QString& oid );

    Q_INVOKABLE int countItem( const QString& kategoriName );

    Q_INVOKABLE bool insertOne( const QString& kategoriName );

    virtual void errorOccured(const std::string &errorText) override;

signals:

};

#endif // TALEPKATEOGORIMANAGERPAGE_H
