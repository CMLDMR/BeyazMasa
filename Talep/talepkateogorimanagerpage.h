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
    TalepKateogoriManagerPage( DataBase* _db );


    virtual void onList(const QVector<SerikBLDCore::TalepKategori> *mlist) override;

signals:

};

#endif // TALEPKATEOGORIMANAGERPAGE_H
