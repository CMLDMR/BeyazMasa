import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import serik.bel.tr.DilekceItem 1.0
import serik.bel.tr.DilekceManagerPage 1.0
import serik.bel.tr.SMSManager 1.0
import serik.bel.tr.SMSObject 1.0
import "../TC"

Item {

    id: dilekceFullViewID
    anchors.fill: parent
    property string dilekceOid
    property DilekceManagerPage dilekceManager: Backend.createDilekceManager();
    property SMSManager smsManager: Backend.createSMSManager();

    property SMSObject smsObj : SMSObject{}

    Rectangle{
        anchors.leftMargin: 284
        anchors.fill: parent




        TCComponent{
            id: tcRect
            width: parent.width
            height: 43
        }


        ScrollView{


            anchors.fill: parent
            anchors.topMargin: tcRect.height
            anchors.bottomMargin: 30
            clip: true
            contentWidth: parent.width



                Column{
                    anchors.fill: parent

                    spacing: 3

                    // dilekceHEADER
                    Rectangle{
                        width: parent.width
                        height: 100
                        color: "transparent"
                        Flow{
                            anchors.fill: parent
                            width: parent.width
                            spacing: 0

                            // Birim
                            Rectangle{
                                width: parent.width
                                height: 30
                                color: "dodgerblue"
                                Row{
                                    anchors.fill: parent


                                    Rectangle{
                                        width: parent.width/2
                                        height: parent.height
                                        color: "DarkSlateGray"
                                        Text {
                                            id: dilekceWebLink
                                            text: "http://www.serik.bel.tr/?type=dilekce&_id="+dilekceOid;
                                            color: "white"
                                            font.bold: false
                                            font.family: "Tahoma"
                                            font.pointSize : 9
                                            width: parent.width
                                            height: parent.height
                                            horizontalAlignment: Text.AlignHCenter
                                            verticalAlignment: Text.AlignVCenter
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
                                        color: "DimGray"
                                        Text {
                                            text: qsTr("Linki Aç")
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
                                                Qt.openUrlExternally(dilekceWebLink.text);
                                            }
                                        }
                                    }

                                    Rectangle{
                                        width: parent.width/4
                                        height: parent.height
                                        color: "LightSlateGray"
                                        Text {
                                            text: qsTr("Linki SMS Gönder")
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
                                                smsObj.smsText = "tetetet";
                                                console.log("SMS TEXT: " + smsObj.smsText);
                                                smsManager.insertSendSMS(smsObj);
                                            }
                                        }
                                    }

                                }




                            }// Birim END

                            // Birim
                            Rectangle{
                                width: parent.width
                                height: 30
                                color: "lightcoral"
                                Text {
                                    id: dilekceBirimText
                                    text: qsTr("Birim")
                                    color: "white"
                                    font.bold: false
                                    font.family: "Tahoma"
                                    font.pointSize : 11
                                    anchors.centerIn: parent
                                    layer.enabled: true
                                    layer.effect: DropShadow{
                                        color: "black"
                                        radius: 3
                                        samples: 5
                                    }
                                }
                            }// Birim END

                            // Konu
                            Rectangle{
                                width: parent.width/12*6
                                height: 40
                                color: "darkslategray"
                                Text {
                                    id: dilekceKonuTextID
                                    text: qsTr("Konu")
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
                            }// Konu END

                            // SAYI
                            Rectangle{
                                width: parent.width/12*1
                                height: 40
                                color: "steelblue"
                                Text {
                                    id: dilekceSayiTextID
                                    text: qsTr("Sayı")
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
                            }//SAYI END

                            //TARIH
                            Rectangle{
                                width: parent.width/12*2
                                height: 40
                                color: "lightsteelblue"
                                Text {
                                    id: dilekceTarihTextID
                                    text: qsTr("Tarih")
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
                            }//TARIH END

                            //icerik tipi
                            Rectangle{
                                width: parent.width/12*3
                                height: 40
                                color: "steelblue"
                                Text {
                                    id: dilekceIcerikTipID
                                    text: qsTr("İçerik Tipi")
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
                            }// icerik tipi END

                        }
                    } // dilekceHeader END

                    //icerik title
                    Rectangle{
                        width: parent.width
                        height: 25
                        color: "cadetblue"
                        Text {
                            padding: 5
                            width: parent.width
                            horizontalAlignment: Text.AlignHCenter
                            text: qsTr("İçerik")
                            color: "white"
                            font.bold: true
                            font.family: "Tahoma"
                            font.pointSize : 11
                            anchors.centerIn: parent
                            wrapMode: Text.WordWrap
                            layer.enabled: true
                            layer.effect: DropShadow{
                                color: "black"
                                radius: 3
                                samples: 5
                            }
                        }
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }//icerik END

                    //icerik
                    Rectangle{
                        width: parent.width
                        color: "cadetblue"
                        Text {
                            padding: 5
                            width: parent.width
                            id: dilekceIcerikTextID
                            text: qsTr("İçerik")
                            color: "white"
                            font.bold: true
                            font.family: "Tahoma"
                            font.pointSize : 9
                            anchors.centerIn: parent
                            wrapMode: Text.WordWrap
                            layer.enabled: true
                            layer.effect: DropShadow{
                                color: "black"
                                radius: 3
                                samples: 5
                            }
                        }
                        height: dilekceIcerikTextID.height
                    }//icerik END

                    // Orjinal Evrak
                    Rectangle{
                        width: parent.width
                        anchors.topMargin: 15
                        height: 30
                        Rectangle{
                            id: taranmisdilekcerectID
                            anchors.centerIn: parent
                            width: 100
                            height: 20
                            color: "darkslategray"
                            radius: 3
                            property string dilekceorjinalevrakid

                            Text {
                                padding: 5
                                width: parent.width
                                id: taranmisdilekce
                                text: qsTr("Orjinal Evrak")
                                color: "white"
                                font.bold: true
                                font.family: "Tahoma"
                                font.pointSize : 9
                                anchors.centerIn: parent
                                horizontalAlignment: Text.AlignHCenter
                                wrapMode: Text.WordWrap
                                layer.enabled: true
                                layer.effect: DropShadow{
                                    color: "black"
                                    radius: 3
                                    samples: 5
                                }
                            }
                            MouseArea{
                                cursorShape: "PointingHandCursor"
                                anchors.fill: parent
                                onClicked: {
                                    Qt.openUrlExternally(Backend.localFileUrl(taranmisdilekcerectID.dilekceorjinalevrakid));
                                }
                            }
                        }
                    }//Orjinal Evrak END

                    // Eklist Rectangle
                    Rectangle{
                        width: parent.width
                        anchors.topMargin: 15
                        height: 30

                        Flow{
                            anchors.fill: parent
                            spacing: 3

                            Repeater{
                                id: eklistrepeaterID
    //                                    model: 3

                                Rectangle{
                                    width: 75
                                    height: 25
                                    color: "red"
                                    radius: 3
                                    Text {
                                        text: modelData["ad"]
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
                                            Qt.openUrlExternally(modelData["url"])
                                        }
                                    }
                                }
                            }
                        }
                    }// Eklist Rectangle END

                    //Görevli Personel Listesi
                    Rectangle{
                        width: parent.width
                        anchors.margins: 15
                        height: 155
                        color: "#9954cfff"
                        id: gorevliPersonelListRecttangeID

                        Rectangle{
                            width: parent.width
                            border.color: "black"
                            border.width: 1
                            height: 1
                            color: "black"
                        }

                        Text {
                            padding: 5
                            id: gorevliPersonelTitleTextID
                            text: qsTr("Görevli Personeller")
                            color: "white"
                            font.bold: true
                            font.family: "Tahoma"
                            font.pointSize : 9
                            anchors.top: parent.top
                            width: parent.width
                            horizontalAlignment: Text.AlignHCenter
                            layer.enabled: true
                            layer.effect: DropShadow{
                                color: "black"
                                radius: 3
                                samples: 5
                            }
                        }


                        Flow{
                            anchors.fill: parent
                            spacing: 3
                            anchors.topMargin: gorevliPersonelTitleTextID.height+2


                            Repeater{
                                id: gorevliListID
    //                                    model: 3

                                Rectangle{
                                    width: 80
                                    height: 105
                                    color: "transparent"
                                    radius: 3


                                    Image {
                                        source: modelData["url"]
                                        fillMode: Image.PreserveAspectCrop
                                        anchors.fill: parent
                                        layer.effect: DropShadow{
                                            color: "black"
                                            radius: 3
                                            samples: 5
                                        }
                                    }

                                    Text {
                                        width: parent.width
                                        wrapMode: Text.WordWrap
                                        text: modelData["ad"]
                                        color: "white"
                                        font.bold: false
                                        font.family: "Tahoma"
                                        font.pointSize : 8
                                        anchors.bottom: parent.bottom
                                        horizontalAlignment: Text.AlignHCenter
                                        layer.enabled: true
                                        layer.effect: DropShadow{
                                            color: "black"
                                            radius: 3
                                            samples: 5
                                        }
                                    }

                                    clip: true


                                }
                            }
                        }


                        Rectangle{
                            width: parent.width
                            border.color: "black"
                            border.width: 1
                            height: 1
                            color: "black"
                            anchors.bottom: parent.bottom
                        }

                    }//Görevli Personel Listesi END

                    //Açıklamalar
                    Rectangle{
                        id: aciklamalarRectID
                        width: parent.width
                        color: "#247182"
                        anchors.margins: 15

                        Rectangle{
                            width: parent.width
                            border.color: "black"
                            border.width: 1
                            height: 1
                            color: "black"
                        }

                        Text {
                            padding: 3
                            id: aciklamaTitleTextID
                            text: qsTr("Açıklamalar")
                            color: "white"
                            font.bold: true
                            font.family: "Tahoma"
                            font.pointSize : 9
                            anchors.top: parent.top
                            width: parent.width
                            horizontalAlignment: Text.AlignHCenter
                            layer.enabled: true
                            layer.effect: DropShadow{
                                color: "black"
                                radius: 3
                                samples: 5
                            }
                        }


                        Column{
                            anchors.fill: parent
                            spacing: 17
                            anchors.topMargin: aciklamaTitleTextID.height+2


                            Repeater{
                                id: aciklamaListID
                                Rectangle{
                                    width: parent.width
                                    color: "#80aed9e6"
                                    radius: 3
                                    Text {
                                        padding: 5
                                        id: aciklamatextID
                                        width: parent.width
                                        wrapMode: Text.WordWrap
                                        text: modelData["aciklama"]
                                        color: "black"
                                        font.bold: false
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.bottom: parent.bottom
                                        horizontalAlignment: Text.AlignJustify
                                    }
                                    height: aciklamatextID.height

    //                                        clip: true

                                    Rectangle{
                                        color: "#5e1f6f"
                                        anchors.left: parent.left
                                        anchors.bottom: parent.top
                                        anchors.leftMargin: 1
                                        Text {

                                            id: aciklamasahibiTextID
                                            text: "  " +modelData["tarih"] + " " + modelData["saat"] + " | " + modelData["person"] + "  ";
                                            color: "white"
                                            font.bold: false
                                            font.family: "Tahoma"
                                            font.pointSize : 8
                                            anchors.centerIn: parent
                                            layer.enabled: true
                                            layer.effect: DropShadow{
                                                color: "black"
                                                radius: 3
                                                samples: 5
                                            }
                                        }
                                        height: aciklamasahibiTextID.height
                                        radius: 3
                                        width: aciklamasahibiTextID.width

                                    }

                                }

                                Component.onCompleted: {
                                    var height_ = 0 ;
                                    for( var i = 0 ; i < count ; i++ )
                                    {
                                        var item_ = itemAt(i);
                                        height_ += item_.height + 18;
                                    }
                                    aciklamalarRectID.height = aciklamaTitleTextID.height + height_;
                                }
                            }
                        }


                        Rectangle{
                            width: parent.width
                            border.color: "black"
                            border.width: 1
                            height: 1
                            color: "black"
                            anchors.bottom: parent.bottom
                        }

                    }//Açıklamalar END





                    // Cevap Dosyası
                    Rectangle{
                        width: parent.width
                        height: 65
                        color: "#0a475e"
                        Column{
                            anchors.fill: parent
                            spacing: 5

                            Rectangle{
                                id: cevapRectangleID
                                width: parent.width
                                height: 25
                                color: "transparent"
                                property var cevapobj
                                clip: true

                                Rectangle{
//                                    width: 100
                                    height: 40
                                    color: "steelblue"
                                    anchors.centerIn: parent
                                    radius: 5
                                    Text {
                                        id: cevapDosyasiTitleTextID
                                        text: qsTr("Cevap Dosyası")
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
                                            if( cevapDosyasiTitleTextID.text === "Henüz Cevap Eklenmemiş" )
                                            {
                                                Backend.message = "Bu Dilekçe Henüz Cevaplanmamış";
                                            }else{
                                                Qt.openUrlExternally(cevapRectangleID.cevapobj["url"]);
                                            }

                                        }
                                    }
                                    width: cevapDosyasiTitleTextID.width > 100 ? (cevapDosyasiTitleTextID.width+10) : 100
                                }



                            }

                            Rectangle{
                                width: parent.width
                                height: 40
                                color: "transparent"
                                Text {
                                    text: cevapRectangleID.cevapobj["personel"] + " " + cevapRectangleID.cevapobj["saat"] + " " +cevapRectangleID.cevapobj["tarih"];
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
                    }//// Cevap Dosyası END


                    Rectangle{
                        id: cevapEklistRectangleID
                        width: parent.width
                        height: 75
                        color: "#840179"

                        Text {
                            text: qsTr("Cevaba Ait Ekler")
                            color: "white"
                            font.bold: true
                            font.family: "Tahoma"
                            font.pointSize : 9
                            anchors.top: parent.top
                            horizontalAlignment: Text.AlignHCenter
                            width: parent.width
                            layer.enabled: true
                            layer.effect: DropShadow{
                                color: "black"
                                radius: 3
                                samples: 5
                            }
                        }

                        Flow{
                            anchors.fill: parent
                            padding: 5
                            anchors.topMargin: 10
                            spacing: 5

                            Repeater{
                                id: cevapEklistRepeater

                                Rectangle{
                                    id: cevapeklistItemRectangleID
                                    height: 20
                                    color: "#047e7c"
                                    property var link: modelData
                                    Text {
                                        padding: 10
                                        text: " EK "+(index+1) + " "
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                        layer.enabled: true
                                        layer.effect: DropShadow{
                                            color: "black"
                                            radius: 2
                                            samples: 4
                                        }
                                        id: cevapeklistfilepath
                                    }
                                    width: cevapeklistfilepath.width

                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: "PointingHandCursor"
                                        onClicked: {
                                            Qt.openUrlExternally(cevapeklistItemRectangleID.link);
                                        }
                                    }
                                }
                            }
                        }
                    }


                }



        }

        Rectangle{
            color: "lightslategray"
            width: parent.width
            height: 30
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
                cursorShape: "PointingHandCursor"
                anchors.fill: parent
                onClicked: {
                    dilekceFullViewID.destroy();
                }
            }

        }

    }

    Component.onCompleted: {

        var dilekceitem = dilekceManager.loadByOid(dilekceOid);

        if( dilekceitem )
        {

            tcRect.tcoid = dilekceitem.tcoid;
            tcRect.initTCComponent();
            dilekceKonuTextID.text = dilekceitem.konu;
            dilekceBirimText.text = dilekceitem.birim;
            dilekceSayiTextID.text = dilekceitem.sayi;
            dilekceTarihTextID.text = dilekceitem.tarihText;
            dilekceIcerikTipID.text = dilekceitem.icerikTipi;
            dilekceIcerikTextID.text = dilekceitem.icerik;
            taranmisdilekcerectID.dilekceorjinalevrakid = dilekceManager.downloadFilePath(dilekceitem.taranmisDilekceOid());
            eklistrepeaterID.model = dilekceManager.ekFilePathList(dilekceitem);

            var _gorevliPersonelList = dilekceManager.gorevliList(dilekceitem);


            if( _gorevliPersonelList.length ){
                gorevliPersonelListRecttangeID.visible = true;
                gorevliListID.model = _gorevliPersonelList;
            }else{
                gorevliPersonelListRecttangeID.visible = false;
            }




            aciklamaListID.model = dilekceManager.aciklamalar(dilekceitem);

            if( aciklamaListID.model.length )
            {
                aciklamalarRectID.visible = true;
            }else{
                aciklamalarRectID.visible = false;
            }

            if( dilekceitem.durum() )
            {

                cevapRectangleID.cevapobj = dilekceManager.cevap(dilekceitem);

                cevapEklistRectangleID.visible = true;

                var eklist = dilekceitem.cevapEkList();

                if( eklist.length !== 0 )
                {
                    cevapEklistRepeater.model = dilekceManager.cevapEkList(eklist);
                }

                for( var x in eklist )
                {
                    console.log("Cevap Eklieri: " + eklist[x]);
                }


            }else{
                cevapDosyasiTitleTextID.text = "Henüz Cevap Eklenmemiş";
                cevapEklistRectangleID.visible = false;
            }
        }else{
            Backend.message = "Dilekçe Bilgileri Yüklenemedi";
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:720;width:1280}
}
##^##*/
