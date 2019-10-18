#include "tcitem.h"

TCItem::TCItem(QObject *parent) : QObject(parent) , TC()
{

}

TCItem::TCItem(const TCItem &other)
{
    this->setDocumentView (other.view ());
}

bool TCItem::tcCheck(const QString &mTC)
{
    TC item;
    item.setTCNO (mTC);
    auto count = this->countItem (item);

    if( count == -1 )
    {
        std::cout << "mTC DataBase Count Error: " << __LINE__ << __FUNCTION__ << std::endl;
        return false;
    }else if (count == 0 ) {
        return false;
    }else{
        return true;
    }

}

bool TCItem::cepTelefonuCheck(const QString &mCepTelefonu)
{
    TC item;
    item.setCepTelefonu (mCepTelefonu);
    auto count = this->countItem (item);

    if( count == -1 )
    {
        std::cout << "mCepTelefonu DataBase Count Error: " << __LINE__ << __FUNCTION__ << std::endl;
        return false;
    }else if (count == 0 ) {
        return false;
    }else{
        return true;
    }
}



void TCItem::testView()
{
    std::cout << bsoncxx::to_json (this->view ()) << std::endl;
}
