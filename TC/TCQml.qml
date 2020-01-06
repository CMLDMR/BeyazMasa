import QtQuick 2.13
import serik.bel.tr.TCManagerPageV2 1.0
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0
import serik.bel.tr.TCItem 1.0
import serik.bel.tr.TCManagerPage 1.0

import serik.bel.tr.SMSManager 1.0
import serik.bel.tr.SMSObject 1.0

Item {

    id: tcQmlRoot
    property TCManagerPageV2 tcManager: Backend.createTCManagerV2();
    property TCItem tcItem

    property string tcoid
    anchors.fill: parent

    signal guncelle(bool guncelle);

    property SMSManager smsManager: Backend.createSMSManager();
    property SMSObject smsObj : SMSObject{}
    Connections {
        target: smsManager
        onNotify: {
            Backend.message = notifyMSG;
        }
    }


    Rectangle{
        anchors.fill: parent

        color: "transparent"



        Component.onCompleted: {
            tcItem = tcManager.loadByOid(tcoid);
            textInputTC.text = tcItem.TCNO;
            textInputAdSoyad.text = tcItem.AdSoyad;
            textInputTelefon.text = tcItem.CepTelefonu;
            textInputAdres.text = tcItem.TamAdres;
            var mahList = Backend.mahalleler;
            var mahCounter = 0;
            for( var x in mahList )
            {
                if( tcItem.Mahalle === mahList[x] )
                {
                    comboBoxMahalle.currentIndex = x;
                    break;
                }
                mahCounter++;
            }

            if( tcItem.CalismaSMS )
            {
                switchSMSGonderID.text = "Gönderilecek"
            }else{
                switchSMSGonderID.text = "Gönderilmeyecek"
            }
        }


        Rectangle{
            anchors.fill: parent
            color: "#80000000"
            clip: false
            MouseArea{
                anchors.fill: parent
            }

            DropShadow {
                anchors.fill: mainRectTCView
                horizontalOffset: 0
                verticalOffset: 1
                radius: 10
                spread: 0.1
                samples: 16
                color: "#B0000000"
                source: mainRectTCView
            }

            Rectangle{
                id: mainRectTCView
                width: 600
                height: 400
                anchors.centerIn: parent
                color: "LightSeaGreen"
                radius: 10
                clip: true



                Column {
                    id: row
                    spacing: 5
                    anchors.fill: parent

                    Rectangle {
                        id: titleRect
                        width: parent.width
                        height: 50
                        gradient: Gradient {
                            GradientStop {
                                position: 0
                                color: "#1e3d47"
                            }

                            GradientStop {
                                position: 1
                                color: "#3176a7"
                            }
                        }

                        Text {
                            id: element
                            color: "#f7f7f7"
                            text: qsTr("TC Bilgileri")
                            font.letterSpacing: 2
                            font.family: "Tahoma"
                            font.pixelSize: 19
                            anchors.centerIn: parent
                        }


                    }

                    Rectangle {
                        id: tcnoRect
                        height: 30
                        color: "#f0f5f8"
                        width: parent.width
                        radius: 5

                        TextInput {
                            id: textInputTC
                            text: qsTr("")
                            font.family: "Tahoma"
                            cursorVisible: false
                            anchors.fill: parent
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            font.pixelSize: 12

                            Text {
                                id: element1
                                color: "gray"
                                text: qsTr("TCNO Giriniz")
                                antialiasing: false
                                font.family: "Tahoma"
                                anchors.centerIn: parent
                                font.pixelSize: 12
                                visible: !parent.text
                            }
                        }

                    }

                    Rectangle {
                        id: adsoyadRect
                        height: 30
                        color: "#ffffff"
                        radius: 5
                        width: parent.width

                        TextInput {
                            id: textInputAdSoyad
                            text: qsTr("")
                            font.family: "Tahoma"
                            anchors.fill: parent
                            cursorVisible: false
                            Text {
                                id: element2
                                color: "#808080"
                                text: qsTr("Ad Soyad Giriniz")
                                anchors.centerIn: parent
                                font.family: "Tahoma"
                                visible: !parent.text
                                font.pixelSize: 12
                            }
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                            verticalAlignment: TextInput.AlignVCenter
                        }
                    }

                    //TELEFON
                    Rectangle {
                        id: telefonRect
                        width: parent.width
                        height: 30
                        color: "#ffffff"
                        radius: 5

                        TextInput {
                            id: textInputTelefon
                            text: qsTr("")
                            font.family: "Tahoma"
                            anchors.fill: parent
                            cursorVisible: false
                            width: parent.width
                            height: parent.height
                            Text {
                                id: element3
                                color: "#808080"
                                text: qsTr("Telefon Numarasını Giriniz")
                                anchors.centerIn: parent
                                font.family: "Tahoma"
                                visible: !parent.text
                                font.pixelSize: 12
                            }
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                            verticalAlignment: TextInput.AlignVCenter
                        }
                    }

                    //ADRES
                    Rectangle {
                        id: adresRect
                        width: parent.width
                        height: 30
                        color: "#ffffff"
                        radius: 5

                        TextInput {
                            id: textInputAdres
                            width: parent.width
                            height: parent.height
                            text: qsTr("")
                            font.family: "Tahoma"
                            anchors.fill: parent
                            cursorVisible: false
                            Text {
                                id: element4
                                color: "#808080"
                                text: qsTr("Adres Giriniz")
                                font.family: "Tahoma"
                                visible: !parent.text
                                anchors.centerIn: parent
                                font.pixelSize: 12
                            }
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                            verticalAlignment: TextInput.AlignVCenter
                        }
                    }

                    ComboBox {
                        id: comboBoxMahalle
                        width: parent.width
                        height: 30
                        wheelEnabled: false
                        model: Backend.mahalleler
                    }

                    Rectangle {
                        id: smsCalismalarRect
                        width: parent.width
                        height: 30
                        color: "#ffffff"
                        radius: 5

                        Row {
                            id: row1
                            anchors.fill: parent

                            Text {
                                id: element5
                                text: qsTr("Çalışmalarla ilgili Bilgilendirme SMS")
                                font.pixelSize: 12
                                width: parent.width/3*2
                                height: 30
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            Switch {
                                id: switchSMSGonderID
                                text: qsTr("Gönderilmeyecek")
                                checked: false
                                width: parent.width/3
                                height: 30
                                onCheckedChanged: {
                                    if( switchSMSGonderID.checked )
                                    {
                                        switchSMSGonderID.text = "Gönderilecek"
                                    }else{
                                        switchSMSGonderID.text = "Gönderilmeyecek"
                                    }
                                }
                            }

                        }
                    }

                    Rectangle{
                        width: parent.width
                        height: 30
                        radius: 5
                        color: "steelblue"

                        Text {
                            text: qsTr("Şifresini Cebine Gönder ( <b>Dikkat Telefonu Doğru Olduğundan Emin Olunuz</b> )")
                            textFormat: Text.RichText
                            color: "white"
                            font.bold: false
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
                                smsObj.smsText = "Şifreniz: " + tcItem.Password + ". İyi Günler Dileriz";
                                smsObj.numaraText = tcItem.CepTelefonu
                                smsManager.insertSendSMS(smsObj);
                            }
                        }
                    }

                }

                Button {
                    id: kaydet
                    width: parent.width
                    height: 30
                    text: qsTr("Güncelle")
                    font.family: "Tahoma"
                    font.bold: true
                    wheelEnabled: false
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: kapat.top
                    anchors.bottomMargin: 5
                    flat: false
                    onClicked: {

                        if( textInputTC.text !== tcItem.TCNO )
                        {
                            if( tcManager.tcCheck(textInputTC.text) )
                            {
                                Backend.message = "Bu TC Kayıtlı";
                                return;
                            }else{
                                tcItem.TCNO = textInputTC.text
                            }
                        }else{
                            tcItem.TCNO = textInputTC.text
                        }


                        if( textInputTelefon.text !== tcItem.CepTelefonu )
                        {
                            if( tcManager.cepTelefonuCheck(textInputTelefon.text) )
                            {
                                Backend.message = "Bu Telefon Numarası Kayıtlı";
                                return;
                            }else{
                                tcItem.CepTelefonu = textInputTelefon.text
                            }
                        }else{
                            tcItem.CepTelefonu = textInputTelefon.text
                        }



                        tcItem.AdSoyad = textInputAdSoyad.text

                        tcItem.Mahalle = comboBoxMahalle.currentText
                        tcItem.TamAdres = textInputAdres.text
                        tcItem.CalismaSMS = switchSMSGonderID.checked

                        if( tcManager.updateTCItem(tcItem) )
                        {
                            Backend.message = "TC Bilgileri Güncellendi";
                            guncelle(true);
                            tcManager.destroy();
                            tcItem.destroy();
                            tcQmlRoot.destroy();
                        }else{
                            Backend.message = "Bilgiler Güncellenemedi";
                        }

                    }
                }

                Button {
                    id: kapat
                    width: parent.width
                    height: 30
                    text: qsTr("Kapat")
                    font.family: "Tahoma"
                    display: AbstractButton.TextBesideIcon
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    onClicked: {
                        tcManager.destroy();
                        tcItem.destroy();
                        tcQmlRoot.destroy();
                    }
                }

            }

        }



    }

}
