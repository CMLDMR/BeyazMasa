#ifndef BILGIEDINMEVALUE_H
#define BILGIEDINMEVALUE_H

#include <QObject>
#include "bilgiEdinme/bilgiedinmeitem.h"


class BilgiEdinmeValue : public QObject , public SerikBLDCore::BilgiEdinmeItem
{
    Q_OBJECT
    Q_PROPERTY (QString konu  READ konu )
    Q_PROPERTY (QString tarih READ tarih )
    Q_PROPERTY (QString saat  READ saat )
    Q_PROPERTY (QString birim READ birim WRITE setBirim )
    Q_PROPERTY (QString oid READ basvuruOid )
    Q_PROPERTY (QString tcoid READ tcOid )
    Q_PROPERTY (QString mesaj READ mesaj )
    Q_PROPERTY (bool cevaplandi READ cevaplandi )
public:
    BilgiEdinmeValue();
    BilgiEdinmeValue( const BilgiEdinmeValue& other );
    BilgiEdinmeValue( BilgiEdinmeValue&& other );
    BilgiEdinmeValue( const SerikBLDCore::BilgiEdinmeItem& other ) ;
    BilgiEdinmeValue( SerikBLDCore::BilgiEdinmeItem&& other );


    QString basvuruOid() const;



    BilgiEdinmeValue& operator=( const SerikBLDCore::BilgiEdinmeItem& other );
    BilgiEdinmeValue& operator=( SerikBLDCore::BilgiEdinmeItem&& other );
};

Q_DECLARE_METATYPE(BilgiEdinmeValue)

#endif // BILGIEDINMEVALUE_H
