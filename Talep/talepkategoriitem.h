#ifndef TALEPKATEGORIITEM_H
#define TALEPKATEGORIITEM_H

#include <QObject>
#include "Talep/talepkategori.h"

class TalepKategoriItem : public QObject , public SerikBLDCore::TalepKategori
{
    Q_OBJECT
public:
    explicit TalepKategoriItem();

    explicit TalepKategoriItem( const TalepKategoriItem& other );
    explicit TalepKategoriItem( TalepKategoriItem&& other );

    explicit TalepKategoriItem( const SerikBLDCore::TalepKategori& other );
    explicit TalepKategoriItem( SerikBLDCore::TalepKategori&& other );


    TalepKategoriItem& operator=( const TalepKategoriItem& other );
    TalepKategoriItem& operator=( TalepKategoriItem&& other );

signals:

};
Q_DECLARE_METATYPE(TalepKategoriItem)

#endif // TALEPKATEGORIITEM_H
