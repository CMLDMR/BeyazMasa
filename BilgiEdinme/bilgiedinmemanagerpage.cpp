#include "bilgiedinmemanagerpage.h"

BilgiEdinmeManagerPage::BilgiEdinmeManagerPage()
    :SerikBLDCore::BilgiEdinme::BilgiEdinmeManager (new DB())
{

}

BilgiEdinmeManagerPage::BilgiEdinmeManagerPage(DB *db)
    :SerikBLDCore::BilgiEdinme::BilgiEdinmeManager (db)
{


   auto cursor = this->UpdateList (SerikBLDCore::BilgiEdinme::BilgiEdinmeItem());


   for( auto item : cursor )
   {
       BilgiEdinmeValue item_;
       item_.setDocumentView (item.view ());
       this->insertModel (item_);
   }

}
