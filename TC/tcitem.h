#ifndef TCITEM_H
#define TCITEM_H

#include <QObject>

class TCItem : public QObject
{
    Q_OBJECT
public:
    explicit TCItem(QObject *parent = nullptr);

signals:

public slots:
};

#endif // TCITEM_H
