import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.12
import "TalepScript.js" as TalepManager
import serik.bel.tr.TCManagerPage 1.0
import serik.bel.tr.TalepItem 1.0
import serik.bel.tr.TalepManagerPage 1.0

Item {
    anchors.fill: parent
    id: yeniTalepID

    property TCManagerPage tcManager: Backend.createTCManager();
    property TalepManagerPage talepManager: Backend.createTalepManager();

    property TalepItem yeniTalepItem: TalepItem{}


    function saveTalep(){

        if( tcoid.length !== 24)
        {
            Backend.message = "TC Hatalı Lütfen TC Giriniz";
            return;
        }

        if( mahalleComboBoxID.currentText === "NULL" )
        {
            Backend.message = "Mahalle Seçmediniz";
            return;
        }


        if( tamAdresInputID.text.length === 0 )
        {
            Backend.message = "Tam Adresi Girmediniz";
            return;
        }

        if( mesajAlaniTextinputID.text.length <= 50 )
        {
            Backend.message = "Konu Alanı 50 Karakterden Az Olamaz";
            return;
        }

        yeniTalepItem.setDate(Backend.currentJulianDay);
        yeniTalepItem.setTime(Backend.mSecStartOfDay);
        yeniTalepItem.konu = mesajAlaniTextinputID.text;
        yeniTalepItem.adres = tamAdresInputID.text;
        yeniTalepItem.tcOid = tcoid;
        yeniTalepItem.mahalle = mahalleComboBoxID.currentText;
        yeniTalepItem.Durum = TalepItem.DevamEdiyor;
        yeniTalepItem.Kaynak = TalepItem.BEYAZMASA;


        if( talepManager.insertTalepItem(yeniTalepItem) )
        {
            topRectIDAnimationDestoyID.start();
        }else{
            Backend.message = "Talep Kayıt Edilemedi";
        }


    }



    property var adsoyad: ""
    property var tcno: ""
    property var telefonno: ""
    property var tcoid: ""

    Rectangle{
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "#b3141414"
        id: topRectID
        MouseArea{
            anchors.fill: parent
        }



        PropertyAnimation{
            target: topRectID
            id: topRectIDAnimationID
            property: "height"
            from: 0
            to: yeniTalepID.height
            duration: 250
        }

        PropertyAnimation{
            target: topRectID
            id: topRectIDAnimationDestoyID
            property: "opacity"
            to: 0
            from: 1
            duration: 500
            onStopped: {
                yeniTalepID.destroy();
            }
        }

        Component.onCompleted: {
            topRectIDAnimationID.start();
        }





        Rectangle{
            anchors.fill: parent
            color: "white"
            anchors.leftMargin: 30
            anchors.rightMargin: 30
            anchors.topMargin: 130
            anchors.bottomMargin: 50
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#6495ed";
                }
                GradientStop {
                    position: 1.00;
                    color: "#ffffff";
                }
            }


            Column{
                anchors.fill: parent

                // Sayfa Başlığı Yeni Talep/Şikayet Gir
                Rectangle{
                    width: parent.width
                    height: 50
                    color: "lightgray"
                    Text {
                        text: qsTr("Yeni Talep/Şikayet Gir")
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

                //TC Sorgulama ve Yeni Girme
                Rectangle{
                    width: parent.width
                    height: 50
                    color: "steelblue"
                    z: 10
                    layer.enabled: true
                    layer.effect: DropShadow{
                        samples: 12
                        radius: 6
                        color: "black"
                    }

                    Row{
                        anchors.fill: parent
                        Rectangle{
                            width: parent.width/6*2
                            height: parent.height
                            color: "slategray"
                            TextInput{
                                width: parent.width
                                height: parent.height
                                horizontalAlignment: TextInput.AlignHCenter
                                verticalAlignment: TextInput.AlignVCenter
                                color: "white"
                                font.bold: true
                                font.family: "Tahoma"
                                font.pointSize: 9
                                Text {
                                    text: qsTr("TCNO Giriniz")
                                    visible: !parent.text
                                    color: "lightgray"
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
                                onTextChanged: {
                                    if( text.length === 11 )
                                    {
                                        var tcVar = tcManager.loadByTC(text);
                                        if( tcVar )
                                        {
                                            adsoyad = tcVar.AdSoyad;
                                            telefonno = tcVar.CepTelefonu;
                                            tcoid = tcVar.tcOid();
                                        }else{
                                            adsoyad = "";
                                            telefonno = "";
                                            tcoid = "";
                                        }
                                    }else{
                                        adsoyad = "";
                                        telefonno = "";
                                        tcoid = "";
                                    }
                                }
                            }
                        }

                        Rectangle{
                            width: parent.width/6
                            height: parent.height
                            color: "transparent"
                            Text {
                                id: adsoyadTextID
                                text: adsoyad
                                color: "white"
                                font.bold: true
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
                                Text {
                                    text: qsTr("Ad Soyad")
                                    visible: !parent.text
                                    color: "white"
                                    opacity: 0.7
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

                        Rectangle{
                            width: parent.width/6
                            height: parent.height
                            color: "transparent"

                            Text {
                                id: cepTelefonuID
                                text: telefonno
                                color: "white"
                                font.bold: true
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
                                Text {
                                    text: qsTr("Cep Telefonu")
                                    visible: !parent.text
                                    color: "white"
                                    opacity: 0.7
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

                        Rectangle{
                            width: parent.width/6
                            height: parent.height
                            color: "transparent"
                            Text {
                                id: tcoidTextID
                                text: tcoid
                                color: "white"
                                font.bold: true
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
                                Text {
                                    text: qsTr("TCOID")
                                    visible: !parent.text
                                    color: "white"
                                    opacity: 0.7
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

                        Rectangle{
                            width: parent.width/6
                            height: parent.height
                            color: "lightSteelBlue"
                            Text {
                                text: qsTr("Yeni TC Kaydet")
                                color: "black"
                                font.bold: true
                                font.family: "Tahoma"
                                font.pointSize : 9
                                anchors.centerIn: parent
                                layer.enabled: true
                                layer.effect: DropShadow{
                                    color: "steelblue"
                                    radius: 2
                                    samples: 4
                                    opacity: 0.75
                                }
                            }
                            radius: 4
                            layer.enabled: true
                            layer.effect: DropShadow{
                                samples: 8
                                radius: 4
                                color: "steelblue"
                            }

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: "PointingHandCursor"
                                onClicked: {
                                    TalepManager.loadyeniTCKaydet();
                                }
                            }

                        }


                    }
                }


                // Adres Mahalle
                Rectangle{
                    width: parent.width
                    height: 50
                    color: "cornflowerblue"
                    Row{
                        anchors.fill: parent
                        Rectangle{
                            width: parent.width/2
                            height: 50
                            color: "transparent"
                            ComboBox{
                                id: mahalleComboBoxID
                                width: parent.width
                                height: parent.height
                                model: Backend.mahalleler
                            }
                        }
                        Rectangle{

                            width: parent.width/2
                            height: 50
                            color: "transparent"

                            TextInput{
                                id: tamAdresInputID
                                width: parent.width
                                height: parent.height
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                                font.bold: true
                                font.family: "Tahoma"
                                font.pointSize: 9
                                color: "white"
                                Text {
                                    visible: !parent.text
                                    text: qsTr("Tam Adres")
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
                }


                // Talep Metni
                Rectangle{
                    width: parent.width
                    height: parent.height-150
                    color: "transparent"
                    TextInput{
                        id: mesajAlaniTextinputID
                        width: parent.width
                        height: parent.height
                        horizontalAlignment: TextInput.AlignLeft
                        verticalAlignment: TextInput.AlignTop
                        padding: 15
                        font.bold: true
                        font.pointSize: 9
                        font.family: "Tahoma"
                        color: "white"
                        wrapMode: Text.WordWrap

                        Text {
                            id: mesajTextPlaceHolderTextID
                            text: qsTr("Talep Metnini Bu Alana Yazınız")
                            color: !parent.text ? "gray" : "white"
                            font.bold: true
                            font.family: "Tahoma"
                            font.pointSize : 9
                            anchors.centerIn: parent
                        }
                        onTextChanged: {
                            if( text.length > 0 )
                            {
                                if( text.length > 50 )
                                {
                                    mesajTextPlaceHolderTextID.text = "Metin Uzunluğu: " + text.length
                                }else{
                                    mesajTextPlaceHolderTextID.text = "Metin Uzunluğu: " + text.length + " (Minumum 50 Karakter)"
                                }
                            }else{
                                mesajTextPlaceHolderTextID.text = "Talep Metnini Bu Alana Yazınız"
                            }
                        }
                    }
                }


            }



            // Kaydet Butonu
            Rectangle{
                anchors.bottom: parent.bottom
                width: parent.width
                anchors.bottomMargin: 50
                height: 50
                color: "darkslategray"
                Text {
                    text: qsTr("Kaydet")
                    color: "lightGray"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize : 9
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    onClicked: {
                        saveTalep();
                    }
                }
            }


            // Kapat Butonu
            Rectangle{
                anchors.bottom: parent.bottom
                width: parent.width
                height: 50
                color: "lightGray"
                Text {
                    text: qsTr("Kapat")
                    color: "darkslategray"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize : 9
                    anchors.centerIn: parent
                    layer.enabled: true
                    layer.effect: DropShadow{
                        color: "lightgray"
                        radius: 3
                        samples: 5
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    onClicked: {
                        topRectIDAnimationDestoyID.start();
                    }
                }
            }


            layer.enabled: true
            layer.effect: DropShadow{
                radius: 5
                samples: 10
                color: "black"
            }

        }





    }




}
