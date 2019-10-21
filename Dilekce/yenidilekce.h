#ifndef YENIDILEKCE_H
#define YENIDILEKCE_H

#include <QObject>
#include "dilekce.h"
#include <QJsonArray>

class YeniDilekce : public QObject , public Dilekce
{
    Q_OBJECT
    Q_PROPERTY(int sayi READ sayi WRITE SetSayi)
    Q_PROPERTY(QString konu READ konu WRITE SetKonu)
    Q_PROPERTY (QJsonArray ekList READ ekList NOTIFY ekListChanged )
public:
    explicit YeniDilekce(QObject *parent = nullptr);
    YeniDilekce(const YeniDilekce& dilekce);
    YeniDilekce(Dilekce* dilekce);
    ~YeniDilekce();

    void operator=( const Dilekce &dilekce);
    void operator=( Dilekce* dilekce);


    Q_INVOKABLE bool save();






    Q_INVOKABLE QJsonArray ekList() const;
    Q_INVOKABLE void addEk( const QString &ekPath );
    Q_INVOKABLE bool deleteEk( const QString &ekPath );

signals:
    void ekListChanged();

public slots:

private:

    QJsonArray mEkList;

};

Q_DECLARE_METATYPE(YeniDilekce)

#endif // YENIDILEKCE_H
