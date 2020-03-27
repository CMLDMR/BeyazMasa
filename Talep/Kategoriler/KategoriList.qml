import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.12
import serik.bel.tr.TalepKateogoriManagerPage 1.0
import "../TalepScript.js" as TalepScript

Item {

    id: kategoriListID

    property TalepKateogoriManagerPage talepKategoriManeger: Backend.createTalepKategoriManager();


    anchors.fill: parent


    MouseArea{
        anchors.fill: parent
    }



    Rectangle{
        color: "#cc7a7a7a"
        anchors.fill: parent

        Rectangle{
            width: parent.width
            height: 50
            anchors.top: parent.top
            Text {
                text: qsTr("Kategoriler")
                color: "white"
                font.bold: true
                font.family: "Tahoma"
                font.pointSize : 9
                anchors.centerIn: parent
            }
        }



        Rectangle{
            anchors.fill: parent
            anchors.topMargin: 50
            anchors.bottomMargin: 100
            color: "dimgray"


            ScrollView{
                width: parent.width
                height: parent.height
                clip: true
                contentWidth: width

                Flow{
                    anchors.fill: parent
                    spacing: 5
                    Repeater{
                        id: talepKategoriListRepeaterID
                        model: talepKategoriManeger.list
                        anchors.fill: parent
                        KategoriListItem{
                            width: parent.width/2-5
                            height: 50
                            item: modelData
                            onDeleteClicked: {
                                var deleted = talepKategoriManeger.deleteOne(oid);
                                if( deleted )
                                {
                                    Backend.message = "Silindi";
                                    talepKategoriManeger.updateKategoriList();
                                }else{
                                    Backend.message = "Silme Başarısız";
                                }
                            }
                        }
                    }
                }
            }


        }





        Rectangle{
            width: parent.width
            height: 50
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            color: "coral"
            Text {
                text: qsTr("Yeni Ekle")
                color: "white"
                font.bold: true
                font.family: "Tahoma"
                font.pointSize : 9
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                onClicked: {

                    var yeniKategoriComp = TalepScript.loadComponent("qrc:/Talep/Kategoriler/KategoriYeniEkle.qml");

                    if( yeniKategoriComp !== null )
                    {
                        yeniKategoriComp.yeniKategoriAdi.connect(function(kategoriAdi){
                            if( talepKategoriManeger.countItem(kategoriAdi) ){
                                Backend.message = "Bu Kategori Adı Zaten Var. Başka Bir Kategori Seçiniz";
                            }else{
                                if( talepKategoriManeger.insertOne(kategoriAdi) ){
                                    yeniKategoriComp.destroy();
                                    Backend.message = "Bu Kategori Adı Eklendi";
                                    talepKategoriManeger.updateKategoriList();
                                }else{
                                    Backend.message = "Uyarı: Bu Kategori Adı Eklenemedi!";

                                }

                            }
                        });
                    }



                }
            }
        }






        Rectangle{
            width: parent.width
            height: 50
            anchors.bottom: parent.bottom
            color: "dimgray"
            Text {
                text: qsTr("Kapat")
                color: "white"
                font.bold: true
                font.family: "Tahoma"
                font.pointSize : 9
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                onClicked: {
                    kategoriListID.destroy();
                }
            }
        }
    }







}
