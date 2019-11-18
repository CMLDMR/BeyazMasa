#ifndef DILEKCEGIRISPAGE_H
#define DILEKCEGIRISPAGE_H

#include <QObject>
#include "db.h"
#include "dilekceitem.h"

class DilekceGirisPage : public QObject , public SerikBLDCore::DB
{
    Q_OBJECT
public:
    explicit DilekceGirisPage(QObject *parent = nullptr);


    Q_INVOKABLE DilekceItem* createYeniDilekce();

signals:

public slots:
};

#endif // DILEKCEGIRISPAGE_H
