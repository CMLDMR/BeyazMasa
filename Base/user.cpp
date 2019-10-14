#include "user.h"

User::User(DB *_db, QObject *parent) : QObject(parent) , Item()
{

}

bool User::login(QString _mTel, QString _mPassword)
{

    this->append(this->KeyTel,_mTel.toStdString ());
    this->append(this->KeyPassword,_mPassword.toStdString ());

    try {
        auto val = this->db ()->collection (Collection).find_one (this->view ());

        if( val )
        {
            std::cout << bsoncxx::to_json (val.value ().view ()) << std::endl;
            this->setDocumentView (val.value ().view ());
            emit logined();
            return true;
        }

    } catch (mongocxx::exception &e) {
        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
        std::cout << str << std::endl;
    }

    return false;



}
