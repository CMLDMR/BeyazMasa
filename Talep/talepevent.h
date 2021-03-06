#ifndef TALEPEVENT_H
#define TALEPEVENT_H

#include <QObject>
#include "Talep/talepsubitem.h"

class TalepEvent : public QObject , public SerikBLDCore::TalepSubItem
{
    Q_OBJECT
    Q_PROPERTY(EventType Type READ eventType WRITE setEventType )
    Q_PROPERTY(QString TypeStr READ eventTypeStr )
    Q_PROPERTY(QString Aciklama READ aciklama WRITE setAciklama )
    Q_PROPERTY(QString talepOid READ talepOid WRITE setTalepOid )
    Q_PROPERTY(QString personelName READ personelName WRITE setPersonelName )
    Q_PROPERTY(QString personelOid READ personelOid WRITE setPersonelOid )
    Q_PROPERTY (QString saat READ saat )
    Q_PROPERTY (QString tarih READ tarih )
    Q_PROPERTY (QString FotoOid READ fotografOid WRITE setFotograf )
    Q_PROPERTY (QString PdfOid READ pdfOid WRITE setPdf )
    Q_PROPERTY (QString sms READ sms WRITE setSms )
    Q_PROPERTY (QString log READ log WRITE setLog )
    Q_PROPERTY (QString typeColor READ typeColor )
    Q_PROPERTY (EventUserType userType READ eventUserType )
    Q_PROPERTY (QString tcName READ tcName )
    Q_PROPERTY (QString tcOid READ tcOid )

public:
    explicit TalepEvent(QObject *parent = nullptr);
    TalepEvent( const TalepEvent& other );
    TalepEvent( TalepEvent&& other );

    TalepEvent& operator=( const TalepEvent& other );
    TalepEvent& operator=( TalepEvent&& other );

    enum EventType{
        none = 0,
        Aciklama,
        Fotograf,
        Pdf,
        Konum,
        Video,
        Sms,
        Log
    };
    Q_ENUM(EventType)


    enum EventUserType
    {
        NoUser = 0,
        PersonelUser,
        TCUser
    };

    Q_ENUM(EventUserType)

    void setEventType( EventType type );

    EventType eventType() const;

    QString eventTypeStr() const;

    EventUserType eventUserType() const;

    QString userTypeStr() const;

signals:

public slots:
};


Q_DECLARE_METATYPE(TalepEvent)


#endif // TALEPEVENT_H
