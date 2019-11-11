import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import "TalepScript.js" as TalepManager
import serik.bel.tr.TalepManagerPage 1.0
import serik.bel.tr.TalepItem 1.0
import serik.bel.tr.TCManagerPage 1.0
import serik.bel.tr.TCItem 1.0
import serik.bel.tr.TalepEvent 1.0


Item {


    id: talepViewID
    anchors.fill: parent
    property string talepOid
    property TalepItem talepItem
    property TalepManagerPage talepManager: Backend.createTalepManager();
    property TCManagerPage tcManager: Backend.createTCManager();
    property TCItem tcItem

    Rectangle{
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#f0499fa0";
            }
            GradientStop {
                position: 1.00;
                color: "#f0292929";
            }
        }
        anchors.fill: parent

        Column{
            anchors.fill: parent
            anchors.bottomMargin: 85
            spacing: 10



            Rectangle{
                width: parent.width
                height: parent.height
                color: "transparent"
                ScrollView{
                    width: parent.width
                    height: parent.height
                    contentWidth: width
                    clip: true
                    Column{
                        anchors.fill: parent
                        spacing: 10
                        padding: 5

                        //TC Bilgileri
                        Rectangle{
                            color: "steelblue"
                            width: parent.width-parent.padding*2
                            height: 50
                            radius: 3
                            layer.enabled: true
                            layer.effect: DropShadow{
                                samples: 6
                                radius: 3
                                color: "black"
                            }

                            Row{
                                anchors.fill: parent
                                Rectangle{
                                    width: parent.width/4
                                    height: parent.height
                                    color: "transparent"
                                    Text {
                                        text: tcItem.AdSoyad
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                        layer.enabled: true
                                        layer.effect: DropShadow{
                                            color: "black"
                                            radius: 3
                                            samples: 5
                                        }
                                    }
                                }
                                Rectangle{
                                    width: parent.width/4
                                    height: parent.height
                                    color: "transparent"
                                    Text {
                                        text: tcItem.CepTelefonu
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                        layer.enabled: true
                                        layer.effect: DropShadow{
                                            color: "black"
                                            radius: 3
                                            samples: 5
                                        }
                                    }
                                }
                                Rectangle{
                                    width: parent.width/4
                                    height: parent.height
                                    color: "transparent"
                                    Text {
                                        text: tcItem.Mahalle
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                        layer.enabled: true
                                        layer.effect: DropShadow{
                                            color: "black"
                                            radius: 3
                                            samples: 5
                                        }
                                    }
                                }

                                Rectangle{
                                    id: kaynakRectID
                                    width: parent.width/4
                                    height: parent.height
                                    color: talepItem.KaynakColor
                                    Text {
                                        text: talepItem.KaynakStr
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                        layer.enabled: true
                                        layer.effect: DropShadow{
                                            color: "black"
                                            radius: 3
                                            samples: 5
                                        }
                                    }
                                }
                            }

                        }



                        // Talep Bilgileri
                        Rectangle{
                            width: parent.width-parent.padding*2
                            height: 150
                            color: "lightskyblue"
                            radius: 5
                            layer.enabled: true
                            layer.effect: DropShadow{
                                samples: 6
                                radius: 3
                                color: "black"
                            }


                            Column{
                                anchors.fill: parent

                                Rectangle{
                                    width: parent.width
                                    height: 30
                                    color: "transparent"
                                    Text {
                                        text: qsTr("Talep/Şikayet Bilgileri")
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                        layer.enabled: true
                                        layer.effect: DropShadow{
                                            color: "black"
                                            radius: 3
                                            samples: 5
                                        }
                                    }
                                }

                                // Tarih Saat Mahalle
                                Rectangle{
                                    width: parent.width
                                    height: 50
                                    color: "transparent"
                                    Row{
                                        anchors.fill: parent
                                        Rectangle{
                                            width: parent.width/4
                                            height: parent.height
                                            color: "transparent"
                                            Text {
                                                text: talepItem.tarih
                                                color: "white"
                                                font.bold: true
                                                font.family: "Tahoma"
                                                font.pointSize : 9
                                                anchors.centerIn: parent
                                                layer.enabled: true
                                                layer.effect: DropShadow{
                                                    color: "black"
                                                    radius: 3
                                                    samples: 5
                                                }
                                            }
                                        }
                                        Rectangle{
                                            width: parent.width/4
                                            height: parent.height
                                            color: "transparent"
                                            Text {
                                                text: talepItem.saat
                                                color: "white"
                                                font.bold: true
                                                font.family: "Tahoma"
                                                font.pointSize : 9
                                                anchors.centerIn: parent
                                                layer.enabled: true
                                                layer.effect: DropShadow{
                                                    color: "black"
                                                    radius: 3
                                                    samples: 5
                                                }
                                            }
                                        }
                                        Rectangle{
                                            width: parent.width/4
                                            height: parent.height
                                            color: "transparent"
                                            Text {
                                                text: talepItem.mahalle
                                                color: "white"
                                                font.bold: true
                                                font.family: "Tahoma"
                                                font.pointSize : 9
                                                anchors.centerIn: parent
                                                layer.enabled: true
                                                layer.effect: DropShadow{
                                                    color: "black"
                                                    radius: 3
                                                    samples: 5
                                                }
                                            }
                                        }

                                        Rectangle{
                                            id: durumRectID
                                            width: parent.width/4
                                            height: parent.height
                                            color: talepItem.DurumColor
                                            layer.enabled: true
                                            layer.effect: DropShadow{
                                                samples: 6
                                                radius: 3
                                                color: "black"
                                            }

                                            Text {
                                                text: talepItem.DurumStr
                                                color: "white"
                                                font.bold: true
                                                font.family: "Tahoma"
                                                font.pointSize : 9
                                                anchors.centerIn: parent
                                                layer.enabled: true
                                                layer.effect: DropShadow{
                                                    color: "black"
                                                    radius: 3
                                                    samples: 5
                                                }
                                            }
                                        }
                                    }
                                }

                                // Konu
                                Rectangle{
                                    width: parent.width
                                    Text {
                                        padding: 10
                                        id: talepKonuTextID
                                        text: talepItem.konu
                                        width: parent.width
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                        layer.enabled: true
                                        layer.effect: DropShadow{
                                            color: "black"
                                            radius: 3
                                            samples: 5
                                        }
                                        wrapMode: Text.WordWrap
                                    }
                                    height: talepKonuTextID.height
                                    color: "transparent"
                                }

                            }
                        }


                        // Adres
                        Rectangle{
                            width: parent.width-parent.padding*2
                            height: 35
                            color: "#80292929"
                            radius: 3
                            layer.enabled: true
                            layer.effect: DropShadow{
                                samples: 5
                                radius: 3
                                color: "black"
                            }

                            Text {
                                padding: 10
                                id: talepAdresTextID
                                text: talepItem.adres
                                width: parent.width
                                color: "white"
                                font.bold: true
                                font.family: "Tahoma"
                                font.pointSize : 9
                                anchors.centerIn: parent
                                layer.enabled: true
                                layer.effect: DropShadow{
                                    color: "black"
                                    radius: 3
                                    samples: 5
                                }
                                wrapMode: Text.WordWrap
                            }
                        }




                        //Talep Açıklamaları
                        Repeater{
                            id: eventListRepeaterID
                            model: talepManager.eventList;
                            Rectangle{
                                width: parent.width-parent.padding*2
                                height: 100
                                color: "lightgray"
                                TalepEventItem{
                                    talepEvent: modelData;
                                    Component.onCompleted: {
                                        if( talepEvent.Type === TalepEvent.Fotograf )
                                        {
                                            parent.color = "orange"
                                        }
                                        if( talepEvent.Type === TalepEvent.Pdf )
                                        {
                                            parent.color = "steelblue"
                                        }
                                        if( talepEvent.Type === TalepEvent.Sms )
                                        {
                                            parent.color = "crimson"
                                        }
                                    }
                                }
                                radius: 5
                                layer.enabled: true
                                layer.effect: DropShadow{
                                    samples: 6
                                    radius: 3
                                    color: "black"
                                }
                            }

                            Component.onCompleted: {
                                talepManager.updateEventList(talepOid);
                            }
                        }

                    }
















                }

            }


        }

        // İşlem
        Rectangle{
            width: parent.width
            height: 35
            color: "transparent"
            anchors.bottom: kapatRectID.top
            Row{
                anchors.fill: parent
                Rectangle{
                    width: parent.width/6
                    height: parent.height
                    color: "DodgerBlue"
                    Text {
                        text: qsTr("Tamamla")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        anchors.centerIn: parent
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }

                Rectangle{
                    width: parent.width/6
                    height: parent.height
                    color: "crimson"
                    Text {
                        text: qsTr("Red Et")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        anchors.centerIn: parent
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }

                Rectangle{
                    width: parent.width/6
                    height: parent.height
                    color: "LightSeaGreen"
                    Text {
                        text: qsTr("Tekrar Aç")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        anchors.centerIn: parent
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }

                Rectangle{
                    width: parent.width/6
                    height: parent.height
                    color: "GoldenRod"
                    Text {
                        text: qsTr("Beklemeye Al")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        anchors.centerIn: parent
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }

                Rectangle{
                    width: parent.width/6
                    height: parent.height
                    color: "dimgray"
                    Text {
                        text: qsTr("Açıklama Ekle")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        anchors.centerIn: parent
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: {
                            TalepManager.loadAciklamaScreen(talepItem.oid);
                        }
                    }
                }

                Rectangle{
                    width: parent.width/6
                    height: parent.height
                    color: "slategray"
                    Text {
                        text: qsTr("Diğer Ekle")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        anchors.centerIn: parent
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            dosyaEkleMenu.popup();
                        }
                    }

                    Menu{
                        id: dosyaEkleMenu
                        MenuItem {
                            text: "Sms Gönder"
                            onClicked: {
                                TalepManager.loadSmsGonderScreen(talepOid)
                            }
                        }
                        MenuItem {
                            text: "Fotoğraf Ekle"
                            onClicked: {
                                TalepManager.loadFotografEkleScreen(talepOid)
                            }
                        }
                        MenuItem {
                            text: "Pdf Ekle"
                            onClicked: {
                                TalepManager.loadPdfEkleScreen(talepOid)
                            }
                        }
//                        MenuItem {
//                            text: "Konum Ekle"
//                            onClicked: {
//                                TalepManager.loadKonumEkleScreen(talepOid)
//                            }
//                        }
                        MenuItem {
                            text: "Video Ekle"
                            onClicked: {
                                Backend.message = "Video Ekleme Şuanda Kullanılamıyor"
                            }
                        }
                    }
                }


            }

            layer.enabled: true
            layer.effect: DropShadow {
                samples: 6
                radius: 3
                color: "black"
            }

        }


        // KAPAT
        Rectangle{
            id: kapatRectID
            width: parent.width
            height: 50
            color: "darkslategray"
            anchors.bottom: parent.bottom
            Text {
                text: qsTr("Kapat")
                color: "white"
                font.bold: true
                font.family: "Tahoma"
                font.pointSize : 9
                anchors.centerIn: parent
                layer.enabled: true
                layer.effect: DropShadow{
                    color: "black"
                    radius: 3
                    samples: 5
                }
            }
            MouseArea{
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                onClicked: {
                    talepViewID.destroy();
                }
            }
        }

    }



    Component.onCompleted: {
        talepItem = talepManager.findOne(talepOid);
        tcItem = tcManager.loadByOid(talepItem.tcOid);
    }






}
