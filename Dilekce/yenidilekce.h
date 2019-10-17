#ifndef YENIDILEKCE_H
#define YENIDILEKCE_H

#include <QObject>
#include "dilekce.h"

class YeniDilekce : public QObject , public Dilekce
{
    Q_OBJECT
public:
    explicit YeniDilekce(QObject *parent = nullptr);
    YeniDilekce(const YeniDilekce& dilekce);
    YeniDilekce(Dilekce* dilekce);
    ~YeniDilekce();

    void operator=( const Dilekce &dilekce);
    void operator=( Dilekce* dilekce);


signals:

public slots:

private:

};

Q_DECLARE_METATYPE(YeniDilekce)

#endif // YENIDILEKCE_H
