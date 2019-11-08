#ifndef TALEPEVENT_H
#define TALEPEVENT_H

#include <QObject>
#include "Talep/talepsubitem.h"

class TalepEvent : public QObject , public TalepSubItem
{
    Q_OBJECT


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
        Video
    };
    Q_ENUM(EventType)

signals:

public slots:
};

#endif // TALEPEVENT_H
