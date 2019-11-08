#ifndef TALEPEVENT_H
#define TALEPEVENT_H

#include <QObject>

class TalepEvent : public QObject
{
    Q_OBJECT
public:
    explicit TalepEvent(QObject *parent = nullptr);

signals:

public slots:
};

#endif // TALEPEVENT_H
