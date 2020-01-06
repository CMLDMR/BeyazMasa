#ifndef TCITEM_H
#define TCITEM_H

#include <QObject>
#include "tc.h"

class TCItem : public QObject , public SerikBLDCore::TC
{
    Q_OBJECT
    Q_PROPERTY(QString TCNO READ TCNO WRITE setTCNO)
    Q_PROPERTY(QString AdSoyad READ AdSoyad WRITE setAdSoyad)
    Q_PROPERTY(QString CepTelefonu READ CepTelefonu WRITE setCepTelefonu)
    Q_PROPERTY(QString Mahalle READ Mahalle WRITE setMahalle)
    Q_PROPERTY(QString TamAdres READ TamAdres WRITE setTamAdress)
    Q_PROPERTY(QString Password READ Password WRITE setPassword)
    Q_PROPERTY(QString NormalTelefon READ NormalTelefon WRITE setNormalTelefon)
    Q_PROPERTY(bool CalismaSMS READ CalismaSMS WRITE setCalismaSMS )
public:
    explicit TCItem(QObject *parent = nullptr);
    TCItem( const TCItem &other);
    TCItem( TCItem&& other);
    explicit TCItem( SerikBLDCore::TC* other);
    explicit TCItem( SerikBLDCore::TC &other );

    TCItem& operator=( const TCItem &other );
    TCItem& operator=( TCItem &&other);

    TCItem& operator=( const SerikBLDCore::TC &other );
    TCItem& operator=( SerikBLDCore::TC &other );



    Q_INVOKABLE QString tcOid();

    Q_INVOKABLE void testView();

signals:

public slots:
};

Q_DECLARE_METATYPE(TCItem)

#endif // TCITEM_H
