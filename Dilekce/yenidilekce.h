#ifndef YENIDILEKCE_H
#define YENIDILEKCE_H

#include <QObject>

class YeniDilekce : public QObject
{
    Q_OBJECT
public:
    explicit YeniDilekce(QObject *parent = nullptr);

signals:

public slots:
};

#endif // YENIDILEKCE_H
