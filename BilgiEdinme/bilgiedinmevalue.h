#ifndef BILGIEDINMEVALUE_H
#define BILGIEDINMEVALUE_H

#include <QObject>
#include "bilgiEdinme/bilgiedinmeitem.h"


class BilgiEdinmeValue : public QObject , public SerikBLDCore::BilgiEdinme::BilgiEdinmeItem
{
    Q_OBJECT
    Q_PROPERTY (QString konu  READ konu WRITE setKonu)
    Q_PROPERTY (QString tarih READ tarih )
    Q_PROPERTY (QString saat  READ saat )
    Q_PROPERTY (QString birim READ birim )
public:
    BilgiEdinmeValue();
    BilgiEdinmeValue( const BilgiEdinmeValue& other );
    BilgiEdinmeValue( BilgiEdinmeValue&& other );
    BilgiEdinmeValue( const SerikBLDCore::BilgiEdinme::BilgiEdinmeItem& other );
    BilgiEdinmeValue( SerikBLDCore::BilgiEdinme::BilgiEdinmeItem&& other );



    BilgiEdinmeValue& operator=( const SerikBLDCore::BilgiEdinme::BilgiEdinmeItem& other );
    BilgiEdinmeValue& operator=( SerikBLDCore::BilgiEdinme::BilgiEdinmeItem&& other );
};

Q_DECLARE_METATYPE(BilgiEdinmeValue)

#endif // BILGIEDINMEVALUE_H
