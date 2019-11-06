#include "talepitem.h"

TalepItem::TalepItem(QObject *parent) : QObject(parent)
{

}

TalepItem::TalepItem(const TalepItem &other)
{
    this->setDocumentView (other.view ());

//    bsoncxx::types::b_dbpointer ()
}
