#include "item.h"

Item::Item()
    :mDoc(document{})
{
    mDoc.clear ();
}

void Item::operator=(const bsoncxx::builder::basic::document &value)
{
    mDoc.clear ();

    for( auto item : value.view () )
    {
        this->append(item.key ().to_string().c_str (),item.get_value ());
    }
}

void Item::operator=(const Item &value)
{
    mDoc.clear ();

    for( auto item : value.view () )
    {
        this->append(item.key ().to_string().c_str (),item.get_value ());
    }
}

bsoncxx::document::view Item::view() const
{
    return mDoc.view ();
}

boost::optional<bsoncxx::types::value> Item::element(QString key)
{

    try {
        return mDoc.view ()[key.toStdString ()].get_value ();
    } catch (bsoncxx::exception &e) {
        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
        std::cout << str << std::endl;
        return boost::none;
    }


}

