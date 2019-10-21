#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include "db.h"
#include <QJsonArray>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString message READ message WRITE setMessage NOTIFY messageChanged)
    Q_PROPERTY(QJsonArray mahalleler READ mahalleler )
    Q_PROPERTY(QJsonArray birimler READ birimler )
public:
    explicit Backend(DB* _db , QObject *parent = nullptr);

    QString message() const;
    void setMessage(const QString &message);

    QJsonArray mahalleler() const;
    QJsonArray birimler() const;


signals:
    void messageChanged(QString _message);
public slots:


private:
    QString mMessage;

    DB* mDB;
};

#endif // BACKEND_H
