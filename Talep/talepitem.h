#ifndef TALEPITEM_H
#define TALEPITEM_H

#include <QObject>
#include "Talep/talep.h"



class TalepItem : public QObject , public Talep
{
    Q_OBJECT
    Q_PROPERTY (QString tcOid READ tcOid WRITE setTCOID)
    Q_PROPERTY (QString mahalle READ mahalle WRITE setMahalle)
    Q_PROPERTY (QString adres READ mahalle WRITE setMahalle)
    Q_PROPERTY (QString konu READ konu WRITE setKonu)
    Q_PROPERTY (QString saat READ saat)
    Q_PROPERTY (QString tarih READ tarih)
    Q_PROPERTY (DurumKey Durum READ durumQML WRITE setQMLDurum )
    Q_PROPERTY (QString DurumStr READ durum )

public:
    explicit TalepItem(QObject *parent = nullptr);
    TalepItem( const TalepItem& other );
    TalepItem( TalepItem&& other );

    TalepItem& operator=( const TalepItem& other);
    TalepItem& operator=( TalepItem&& other );


    enum DurumKey
    {
        DevamEdiyor,
        Tamamlandi,
        TeyitEdilmemis,
        Beklemede,
        RedEdildi
    };
    Q_ENUM(DurumKey)



    Q_INVOKABLE void setTime( const int &mStartOfDay );
    Q_INVOKABLE void setDate( const int &julianDay );
    Q_INVOKABLE void setQMLDurum( const DurumKey &durum);
    DurumKey durumQML() const;


signals:

public slots:


};
Q_DECLARE_METATYPE(TalepItem)

#endif // TALEPITEM_H
