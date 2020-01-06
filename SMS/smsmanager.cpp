#include "smsmanager.h"


SMSManager::SMSManager(DataBase *_db) : SerikBLDCore::SMSAbstractManager (_db)
{
    mNetworkAccessManager = new QNetworkAccessManager();
    mSMSGonderiliyor = false;
}

SMSManager::SMSManager(const DataBase *_db) : SerikBLDCore::SMSAbstractManager (_db)
{
    mNetworkAccessManager = new QNetworkAccessManager();
    mSMSGonderiliyor = false;
}

SMSManager::SMSManager(const SMSManager &other) : SerikBLDCore::SMSAbstractManager (other.getDB ())
{
    mNetworkAccessManager = new QNetworkAccessManager();
    mSMSGonderiliyor = false;
}

SMSManager::SMSManager(SMSManager &&other) : SerikBLDCore::SMSAbstractManager (other.getDB ())
{
    mNetworkAccessManager = new QNetworkAccessManager();
    mSMSGonderiliyor = false;
}

SMSManager &SMSManager::operator=(const SMSManager &other)
{
    mNetworkAccessManager = other.mNetworkAccessManager;
    mSMSGonderiliyor = false;
    return *this;
}

SMSManager &SMSManager::operator=(SMSManager &&other)
{
    mNetworkAccessManager = other.mNetworkAccessManager;
    mSMSGonderiliyor = false;
    return *this;
}


bool SMSManager::insertAndSendSMS(const SerikBLDCore::SMS::SMSItem &item)
{
    if( mSMSGonderiliyor )
    {
        emit notify ("Şuan da Bir SMS Gönderim Aşamasında\nLütfen Bekleyiniz");
        return false;
    }

    QByteArray ar;

    ar.clear();

    QXmlStreamWriter stream(&ar);
    stream.setAutoFormatting(true);
    stream.writeStartDocument();

    stream.writeStartElement("MainmsgBody");

    stream.writeTextElement("Command" , SMSCONFIG::Command.c_str());
    stream.writeTextElement("PlatformID" , SMSCONFIG::PlatformID.c_str());
    stream.writeTextElement("ChannelCode" , SMSCONFIG::ChannelCode.c_str ());
    stream.writeTextElement("UserName" , SMSCONFIG::UserName.c_str ());
    stream.writeTextElement("PassWord" , SMSCONFIG::Password.c_str ());
    stream.writeTextElement("Mesgbody" , item.smsText () );
    stream.writeTextElement("Numbers" , item.numaraText () );
    stream.writeTextElement("Type" , SMSCONFIG::Type.c_str () );
    stream.writeTextElement("Concat" , SMSCONFIG::Concat.c_str() );
    stream.writeTextElement("Originator" , SMSCONFIG::Originator.c_str () );

    stream.writeEndElement();

    stream.writeEndDocument();

    QNetworkRequest request;
    request.setUrl (QUrl("http://processor.smsorigin.com/xml/process.aspx"));

    request.setHeader(QNetworkRequest::ContentTypeHeader,QVariant("application/x-www-form-urlencoded"));

    auto reply = mNetworkAccessManager->post (request,ar);
    mSMSGonderiliyor = true;

    connect(reply, &QIODevice::readyRead, [=](){
        SerikBLDCore::SMS::SMSItem _item;
        _item.setID (reply->readAll ());
        _item.setSMS (item.smsText ());
        _item.setNumara (item.numaraText ());
        _item.setJulianDay (QDate::currentDate ().toJulianDay ());
        _item.setmSecStartOfDay (QTime::currentTime ().msecsSinceStartOfDay ());
        if( this->insertItem (_item) ){
            emit notify ("SMS Gönderildi ve Kayıt Edildi");
            mSMSGonderiliyor = false;
        }else{
            emit notify ("SMS Kayıt Edilemedi");
            mSMSGonderiliyor = false;
        }
    });

    connect(reply, QOverload<QNetworkReply::NetworkError>::of(&QNetworkReply::error),
            [=](){
        emit notify ("SMS Gönderilirken Hata Oluştu: "+ reply->errorString ());
        mSMSGonderiliyor = false;
    });


    connect(reply, &QNetworkReply::sslErrors,
            [=](){
        emit notify ("SMS Gönderilirken SSL Hatası Oluştu.");
        mSMSGonderiliyor = false;
    });
    return true;
}

bool SMSManager::checkRapor(const SerikBLDCore::SMS::SMSItem &item)
{
    if( mSMSGonderiliyor )
    {
        emit notify ("Şuan da Bir SMS Gönderim Aşamasında\nLütfen Bekleyiniz");
        return false;
    }


    mLastCheckItemOid = QString::fromStdString (item.oid ().value ().to_string ());


    QByteArray ar;

    ar.clear();

    QXmlStreamWriter stream(&ar);
    stream.setAutoFormatting(true);
    stream.writeStartDocument();
    stream.writeStartElement("MainReportRoot");
    stream.writeTextElement("Command", QString::number (15));
    stream.writeTextElement("PlatformID", SMSCONFIG::PlatformID.c_str());
    stream.writeTextElement("ChannelCode", SMSCONFIG::ChannelCode.c_str ());
    stream.writeTextElement("UserName", SMSCONFIG::UserName.c_str ());
    stream.writeTextElement("PassWord", SMSCONFIG::Password.c_str ());
    stream.writeTextElement("MsgID", item.idText ().mid (3,9));
    stream.writeTextElement("Status", "");
    stream.writeTextElement("AddDeliveryTime", "1");
    stream.writeEndElement();
    stream.writeEndDocument();

    QNetworkRequest request;
    request.setUrl (QUrl("http://processor.smsorigin.com/xml/process.aspx"));

    request.setHeader(QNetworkRequest::ContentTypeHeader,QVariant("application/x-www-form-urlencoded"));

    auto reply = mNetworkAccessManager->post (request,ar);
    mSMSGonderiliyor = true;

    connect(reply, &QIODevice::readyRead, [=](){
        SerikBLDCore::SMS::SMSItem _item;
        _item.setOid (mLastCheckItemOid.toStdString ());
        QString rapor = reply->readAll ();
        auto raporlist = rapor.split (" ");
        QString raporText;
        if( raporlist.size () >= 3 )
        {
            QString _numara = raporlist.first ();
            QString _sonuc = raporlist.at (1);
            _item.setRaporID (_sonuc.toInt ());
            QString _zaman = raporlist.at (2);

            switch (_sonuc.toUInt ()) {
            case 3:
                _sonuc = "Başarılı (Alıcıya başarılı olarak iletilmiş)";
                break;
            case 5:
                _sonuc = "Başarısız (GSM numarası hatalı ya da gönderim iptal edilmiş)";
                break;
            case 6:
                _sonuc = "Beklemede (İşlemde veya gönderilmeye çalışılıyor)";
                break;
            case 9:
                _sonuc = "Zaman Aşımı (Geçerlilik süresi bitene kadar gönderilmeye çalışılmış fakat başarısız olmuş)";
                break;
            default:
                break;
            }

            raporText = QDate::fromString (_zaman.mid (0,8),"yyyyMMdd").toString ("dd/MM/yyyy dddd")+
                    QTime::fromString (_zaman.mid (8,6),"hhmmss").toString ("hh:mm:ss") + " Tarihinde : " + _sonuc;

            _item.setRapor (raporText);

        }


        if( raporText.count () )
        {
            auto val = this->updateItem (_item);
            if( val )
            {
                if( val.value ().modified_count () )
                {
                    emit notify ("Rapor Alındı ve Kayıt Edildi");
                }else{
                    emit notify ("Bilgi: Rapor Değişikliği Yok"+this->getLastError ());
                }
            }else{
                emit notify (this->getLastError ());
            }
        }else{
            emit notify ("Alınan Rapor da Bir Hata Oluştu: " + rapor + " - " + std::to_string (rapor.split (" ").count ()).c_str ());
        }
        mSMSGonderiliyor = false;

    });

    connect(reply, QOverload<QNetworkReply::NetworkError>::of(&QNetworkReply::error),
            [=](){
        emit notify ("İleti Raporunda Hata Oluştu: "+ reply->errorString ());
        mSMSGonderiliyor = false;
    });


    connect(reply, &QNetworkReply::sslErrors,
            [=](){
        emit notify ("İleti Raporunda SSL Hatası Oluştu.");
        mSMSGonderiliyor = false;
    });
    return true;
}

bool SMSManager::insertSendSMS( const SMSObject* item)
{
    int kalanSure;
    if( this->canSend (item->numaraText () , kalanSure ) )
    {
        return this->insertAndSendSMS (static_cast<SerikBLDCore::SMS::SMSItem>(*item));
    }else{
        emit notify ("Bu Numaraya 1 Dakika İçinde 2 Mesaj Atamazsınız."+
                     QString("Kalan Süre: %1")
                     .arg (QTime::fromMSecsSinceStartOfDay (60000-kalanSure).toString ("mm:ss")));
    }
    return false;
}
