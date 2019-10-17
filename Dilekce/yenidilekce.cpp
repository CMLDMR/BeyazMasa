#include "yenidilekce.h"
#include <boost/optional.hpp>

YeniDilekce::YeniDilekce(QObject *parent) : QObject(parent) , Dilekce (Create_Dilekce ().get ())
{

    this->SetSayi (4422);

    this->Update ();
}

YeniDilekce::YeniDilekce(const YeniDilekce &dilekce)
{
    std::cout << "copy Cosntructor" << std::endl;
    this->setDocumentView (dilekce.view ());
}

YeniDilekce::YeniDilekce(Dilekce *dilekce)
{
    this->setDocumentView (dilekce->view ());

}

YeniDilekce::~YeniDilekce()
{
    std::cout << "Destrutor of Yeni Dilekce" << std::endl;
}

void YeniDilekce::operator=(const Dilekce &dilekce)
{
    this->setDocumentView (dilekce.view ());
}

void YeniDilekce::operator=(Dilekce *dilekce)
{
    this->setDocumentView (dilekce->view ());
}
