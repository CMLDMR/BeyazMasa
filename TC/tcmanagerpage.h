#ifndef TCMANAGERPAGE_H
#define TCMANAGERPAGE_H

#include <QObject>
#include "tcmanager.h"
#include "Comman/database.h"
#include "Comman/managerpage.h"

#include "tcitem.h"



class TCManagerPage : public QObject , public SerikBLDCore::TCManager
{
    Q_OBJECT



public:
    explicit TCManagerPage(QObject *parent = nullptr);
    explicit TCManagerPage(DataBase* _db );


    Q_INVOKABLE bool tcCheck( const QString& mTC );

    Q_INVOKABLE bool cepTelefonuCheck( const QString& mCepTelefonu );

    Q_INVOKABLE bool saveTCItem(TCItem *item );

    Q_INVOKABLE TCItem *loadByTC(const QString &mTCNO);

    Q_INVOKABLE TCItem* loadByTel( const QString &mTel );

    Q_INVOKABLE TCItem* loadByOid( const QString &mOid );

    Q_INVOKABLE QString generatePassword() const;

signals:

public slots:
};



class TCManagerPageV2 : public ManagerPage<TCItem> , public SerikBLDCore::TCManagerV2
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<TCItem> list READ list NOTIFY listChanged )
    Q_PROPERTY (QString currentPage READ currentPage NOTIFY currentPageNotify )
public:
    explicit TCManagerPageV2(QObject *parent = nullptr);
    explicit TCManagerPageV2(DataBase* _db);

    virtual void onList(const QVector<SerikBLDCore::TC> *mlist) override;

    virtual void errorOccured(const std::string &errorText) override;

    Q_INVOKABLE void updatelist();

    Q_INVOKABLE void updateWidthTCNO( const QString& tcno );

    Q_INVOKABLE void updateWidthAdSoyad( const QString& adsoyad );

    Q_INVOKABLE void updateWidthTelefon( const QString& telefon );

    Q_INVOKABLE void next();

    Q_INVOKABLE void back();

    QString currentPage();



signals:
    void errorOccur(QString);

    void currentPageNotify();
private:
    TCItem filter;
};



#endif // TCMANAGERPAGE_H
