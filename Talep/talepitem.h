#ifndef TALEPITEM_H
#define TALEPITEM_H

#include <QObject>
#include "Talep/talep.h"



class TalepItem : public QObject , public Talep
{
    Q_OBJECT
    Q_PROPERTY(QString tcOid READ tcOid WRITE setTCOID)
    Q_PROPERTY(QString mahalle READ mahalle WRITE setMahalle)
public:
    explicit TalepItem(QObject *parent = nullptr);
    TalepItem( const TalepItem& other );

signals:

public slots:
};
Q_DECLARE_METATYPE(TalepItem)

#endif // TALEPITEM_H
