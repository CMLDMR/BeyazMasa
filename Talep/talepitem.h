#ifndef TALEPITEM_H
#define TALEPITEM_H

#include <QObject>
#include "Talep/talep.h"



class TalepItem : public QObject , public Talep
{
    Q_OBJECT
    Q_PROPERTY (QString oid READ oid)
    Q_PROPERTY (QString tcOid READ tcOid WRITE setTCOID NOTIFY tcOidChanged)
    Q_PROPERTY (QString mahalle READ mahalle WRITE setMahalle NOTIFY mahalleChanged)
    Q_PROPERTY (QString adres READ adres WRITE setAddress NOTIFY adresChanged)
    Q_PROPERTY (QString konu READ konu WRITE setKonu NOTIFY konuChanged)
    Q_PROPERTY (QString saat READ saat)
    Q_PROPERTY (QString tarih READ tarih)
    Q_PROPERTY (DurumKey Durum READ durumQML WRITE setQMLDurum  NOTIFY qmlDurumChanged)
    Q_PROPERTY (QString DurumStr READ durum  NOTIFY qmlDurumChanged)
    Q_PROPERTY (QString DurumColor READ durumColor NOTIFY qmlDurumChanged)
    Q_PROPERTY (Kaynak Kaynak READ kaynakQML WRITE setQMLKaynak  NOTIFY qmlKaynakChanged)
    Q_PROPERTY (QString KaynakStr READ kaynak  NOTIFY qmlKaynakChanged)
    Q_PROPERTY (QString KaynakColor READ kaynakColor NOTIFY qmlKaynakChanged)

public:
    explicit TalepItem(QObject *parent = nullptr);
    TalepItem( const TalepItem& other );
    TalepItem( TalepItem&& other );

    TalepItem& operator=( const TalepItem& other);
    TalepItem& operator=( TalepItem&& other );


    enum DurumKey
    {
        NONE,
        DevamEdiyor,
        Tamamlandi,
        TeyitEdilmemis,
        Beklemede,
        RedEdildi
    };
    Q_ENUM(DurumKey)


    enum Kaynak{
        SMS = 0,
        BEYAZMASA,
        TELEFON,
        WEB,
        MOBIL,
        SOSYALMEDYA
    };
    Q_ENUM(Kaynak)



    Q_INVOKABLE void setTime( const int &mStartOfDay );
    Q_INVOKABLE void setDate( const int &julianDay );
    Q_INVOKABLE void setQMLDurum( const DurumKey &durum);
    DurumKey durumQML() const;

    Q_INVOKABLE void setQMLKaynak( const Kaynak &kaynak);
    Kaynak kaynakQML() const;


signals:
    void tcOidChanged();
    void mahalleChanged();
    void adresChanged();
    void konuChanged();
    void qmlDurumChanged();
    void qmlKaynakChanged();

public slots:


};
Q_DECLARE_METATYPE(TalepItem)

#endif // TALEPITEM_H
