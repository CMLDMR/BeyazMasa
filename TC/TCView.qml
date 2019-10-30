import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3
import serik.bel.tr.TCItem 1.0
import serik.bel.tr.TCManagerPage 1.0


Item {

    anchors.fill: parent
    id: yeniTCKaydetID

    property TCManagerPage tcManager: Backend.createTCManager();


    TCItem{
        id: tcItem
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
                        text: qsTr("Yeni TC Kaydet")
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

            }

            Button {
                id: kaydet
                width: parent.width
                height: 30
                text: qsTr("Kaydet")
                font.family: "Tahoma"
                font.bold: true
                wheelEnabled: false
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: kapat.top
                anchors.bottomMargin: 5
                flat: false
                onClicked: {
                    tcItem.TCNO = textInputTC.text
                    tcItem.AdSoyad = textInputAdSoyad.text
                    tcItem.CepTelefonu = textInputTelefon.text
                    tcItem.Mahalle = comboBoxMahalle.currentText
                    tcItem.TamAdres = textInputAdres.text
                    tcItem.Password = tcManager.generatePassword();
                    tcItem.CalismaSMS = switchSMSGonderID.checked
                    var a = tcManager.tcCheck(textInputTC.text);
                    if( a )
                    {
                        Backend.message = "Bu TC Kayıtlı";
                    }else{
                        var b  = tcManager.cepTelefonuCheck(textInputTelefon.text)
                        if( b )
                        {
                            Backend.message = "Bu Telefon Numarası Kayıtlı";
                        }else{
//                            console.log("testView");
//                            tcItem.testView();
                            if( tcManager.saveTCItem(tcItem) ){
                                Backend.message = "TC Bilgileri Başarılı Bir Şekilde Kayıt Edildi.\nŞifre: " + tcItem.Password;
                                yeniTCKaydetID.destroy();
                            }else{
                                Backend.message = "TC Bilgileri Kayıt Edilemedi";
                            }
                        }
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
                    yeniTCKaydetID.destroy();
                }
            }

        }

    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
