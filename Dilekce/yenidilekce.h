#ifndef YENIDILEKCE_H
#define YENIDILEKCE_H

#include <QObject>
#include "dilekce.h"
#include <QJsonArray>

class DilekceItem : public QObject , public Dilekce
{
    Q_OBJECT
    Q_PROPERTY (int sayi READ sayi WRITE SetSayi)
    Q_PROPERTY (QString konu READ konu WRITE SetKonu)
    Q_PROPERTY (QString tcoid READ tcoid WRITE SetTCOid )
    Q_PROPERTY (QString birim READ birim WRITE SetBirim )
    Q_PROPERTY (QString icerikTipi READ icerikTipi WRITE SetIcerikTipi )
    Q_PROPERTY (QString icerik READ icerik WRITE SetIcerik )
    Q_PROPERTY (int tarihJulianDay READ tarihJulian WRITE SetTarih )
    Q_PROPERTY (QString tarihText READ tarihText )
    Q_PROPERTY (int saatMSecStartofDay READ saatMSecStartofDay WRITE SetSaat )
    Q_PROPERTY (QString saatText READ saatText )
    Q_PROPERTY (QJsonArray ekList READ ekList NOTIFY ekListChanged )
    Q_PROPERTY (QJsonArray bilgiBirim READ bilgiBirimList NOTIFY bilgiBirimChanged )
    Q_PROPERTY (QString dilekceFilePath READ dilekceFilePath WRITE setDilekceFilePath )
public:
    explicit DilekceItem(QObject *parent = nullptr);
    DilekceItem(const DilekceItem& dilekce);
    DilekceItem(Dilekce* dilekce);
    ~DilekceItem();

    void operator=( const Dilekce &dilekce);
    void operator=( Dilekce* dilekce);


    Q_INVOKABLE bool save();


    Q_INVOKABLE void testView();





    Q_INVOKABLE QJsonArray ekList() const;
    Q_INVOKABLE void addEk( const QString &ekPath );
    Q_INVOKABLE bool deleteEk( const QString &ekPath );

    Q_INVOKABLE QJsonArray bilgiBirimList() const;
    Q_INVOKABLE void addBilgiBirim( const QString &_birim );
    Q_INVOKABLE bool deleteBilgiBirim( const QString &_birim );

    QString dilekceFilePath() const;
    void setDilekceFilePath(const QString &dilekceFilePath);

signals:
    void ekListChanged();
    void bilgiBirimChanged();

public slots:

private:

    QJsonArray mEkList;
    QJsonArray mBilgiBirimList;

    QString mDilekceFilePath;

};

Q_DECLARE_METATYPE(DilekceItem)

#endif // YENIDILEKCE_H
