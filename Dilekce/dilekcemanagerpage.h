#ifndef DILEKCEMANAGERPAGE_H
#define DILEKCEMANAGERPAGE_H

#include <QObject>
#include "dilekcemanager.h"

class DilekceManagerPage : public QObject , public DilekceManager
{
    Q_OBJECT
public:
    explicit DilekceManagerPage(QObject *parent = nullptr);

signals:

public slots:
};

#endif // DILEKCEMANAGERPAGE_H
