#ifndef ITEM_H
#define ITEM_H

#include "mongoheaders.h"
#include <QString>
#include <iostream>
#include <boost/optional.hpp>

class Item
{
public:
    Item();




    void operator=(const document &value);
    void operator=(const Item &value);

    bsoncxx::document::view view() const;

    boost::optional<bsoncxx::types::value> element(QString key);

    template<typename T>
    void append(QString key ,const T &value){
        try {
            mDoc.append (kvp(key.toStdString (),value));
        } catch (bsoncxx::exception &e) {
            std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
            std::cout << str << std::endl;
        }
    }


private:
    document mDoc;
};

#endif // ITEM_H
