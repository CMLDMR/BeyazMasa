#include "talepmanagerpage.h"



TalepManagerPage::TalepManagerPage(QObject *parent) : QObject(parent) , TalepManager()
{

}

TalepManagerPage::TalepManagerPage(DataBase *_db) : TalepManager (_db)
{

}

bool TalepManagerPage::insertTalepItem( TalepItem *item )
{
    return this->insertTalep (item);
}

