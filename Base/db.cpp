#include "db.h"
#include <QFile>
#include <QByteArray>
#include <QFileInfo>
#include <fstream>
#include <QDir>

DB::DB()
{

    try {
        mClient = new mongocxx::client(mongocxx::uri(_url));
    } catch (mongocxx::exception &e) {
        std::string str = "ERROR: " + std::to_string(__LINE__) + " " + __FUNCTION__ + " " + e.what();
        std::cout << str << std::endl;
    }

    _mDB = mClient->database (DB__);

    this->mDB = &_mDB;

}

DB::DB(mongocxx::database *_db)
    :mDB(_db)
{

}

DB::DB(DB *_db)
    :mDB(_db->db ())
{

}

mongocxx::database *DB::db()
{
    return this->mDB;
}

QString DB::downloadFile(const QString &fileOid, bool forceFilename)
{
    auto bucket = this->mDB->gridfs_bucket ();

    auto doc = bsoncxx::builder::basic::document{};

    try {
        doc.append(bsoncxx::builder::basic::kvp("key",bsoncxx::oid{fileOid.toStdString ()}));
    } catch (bsoncxx::exception& e) {
        std::cout << __LINE__ << " Error: " << e.what() << std::endl;
        return "NULL";
    }



    mongocxx::gridfs::downloader downloader;
    try {
        auto roid = bsoncxx::types::value(doc.view()["key"].get_oid());
        downloader = bucket.open_download_stream(roid);

    } catch (bsoncxx::exception &e) {
        return "";
    }


    auto file_length = downloader.file_length();
    auto bytes_counter = 0;

    QFileInfo info( downloader.files_document()["filename"].get_utf8().value.to_string().c_str() );

    QString fullFilename;

    QDir dir;

    if( !dir.exists ("tempfile") )
    {
        dir.mkdir ("tempfile");
    }

    if( forceFilename )
    {
        fullFilename = QString("tempfile/%1").arg(downloader.files_document()["filename"].get_utf8().value.to_string().c_str());
    }else{
        fullFilename = QString("tempfile/%2.%1").arg(info.suffix())
                .arg(downloader.files_document()["_id"].get_oid().value.to_string().c_str());
    }


    if( QFile::exists(fullFilename) )
    {
        return fullFilename;
    }else{
        std::cout << "FILE NOT FOUND: " << fullFilename.toStdString() << std::endl;
    }

    auto buffer_size = std::min(file_length, static_cast<std::int64_t>(downloader.chunk_size()));
    auto buffer = bsoncxx::stdx::make_unique<std::uint8_t[]>(static_cast<std::size_t>(buffer_size));

    std::ofstream out;

    out.open(fullFilename.toStdString(),std::ios::out | std::ios::app | std::ios::binary);


    if( out.is_open() )
    {

        while ( auto length_read = downloader.read(buffer.get(), static_cast<std::size_t>(buffer_size)) ) {

            auto bufferPtr = buffer.get();
            out.write(reinterpret_cast<char*>(bufferPtr),length_read);

            bytes_counter += static_cast<std::int32_t>( length_read );

        }

        out.close();
    }

    else{
        std::cout << "Error Can Not Open File: " <<fullFilename.toStdString() << std::endl;
    }

    return fullFilename;
}

bsoncxx::types::value DB::uploadfile(QString filepath)
{
    auto bucket = this->mDB->gridfs_bucket ();
    QFile file( filepath );
    if( file.open( QIODevice::ReadOnly ) )
    {
        QFileInfo info(filepath);
        auto uploader = bucket.open_upload_stream(info.fileName().toStdString().c_str());
        QByteArray ar = file.readAll();
        uploader.write((std::uint8_t*)ar.data(),ar.size());
        auto res = uploader.close();
        file.close();
        return res.id();
    }
}
