#ifndef BILGIEDINMEMANAGERPAGE_H
#define BILGIEDINMEMANAGERPAGE_H

#include "bilgiEdinme/bilgiedinmemanager.h"
#include "Comman/managerpage.h"
#include "BilgiEdinme/bilgiedinmevalue.h"

class BilgiEdinmeManagerPage : public ManagerPage<BilgiEdinmeValue> , public SerikBLDCore::BilgiEdinmeManager
{
    Q_OBJECT
    Q_PROPERTY(QQmlListProperty<BilgiEdinmeValue> list READ list NOTIFY listChanged )
    Q_PROPERTY (QString currentPage READ currentPage NOTIFY currentPageChanged )

public:
    explicit BilgiEdinmeManagerPage();
    explicit BilgiEdinmeManagerPage(DB* db);

    Q_INVOKABLE BilgiEdinmeValue *valueAt( const QString &byOid );

    Q_INVOKABLE bool updateItem(BilgiEdinmeValue *item );

    virtual void onList(const QVector<SerikBLDCore::BilgiEdinmeItem> *mlist) override{

    }

    Q_INVOKABLE void refreshList();

    Q_INVOKABLE void next();
    Q_INVOKABLE void back();

    Q_INVOKABLE void bekleyenler();

    Q_INVOKABLE void cevaplanmayanlar();

    Q_INVOKABLE void cevaplananlar();


    QString currentPage();

signals:
    void currentPageChanged();

private:

    void _refreshList();

    void operator++();
    void operator--();
    int limit = 20 ;
    int skip = 0 ;

    int mDocumentCount;


    BilgiEdinmeValue mCurrentFilter;

};


#endif // BILGIEDINMEMANAGERPAGE_H
