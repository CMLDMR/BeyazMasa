import QtQuick 2.13
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.13
import QtQuick.Dialogs 1.3
import serik.bel.tr.DilekceItem 1.0
import serik.bel.tr.DilekceManagerPage 1.0
import serik.bel.tr.TCManagerPage 1.0
import serik.bel.tr.TCItem 1.0
import "../TC/TCScript.js" as TCView


Item {

    id: yeniDilekcePageID
    anchors.fill: parent

    property int componentHeight: 30
    property DilekceManagerPage dilekceManager: Backend.createDilekceManager();

    property TCManagerPage tcManager: Backend.createTCManager();

    MouseArea{
        anchors.fill: parent
    }


    DilekceItem{
        id: yeniDilekceID
    }

    property var tcno: ""
    property var telefonno: ""
    property var address: ""

    Rectangle{
        anchors.fill: parent

        color: "#99ffffff"

        Rectangle{
            color: "darkSlateGray"
            width: parent.width-100
            height: parent.height-100
            anchors.centerIn: parent
            radius: 5
            border.color: "black"
            layer.enabled: true
            layer.effect: DropShadow{
                samples: 16
                radius: 12
                color: "black"
            }

            ScrollView{
                anchors.fill: parent
                clip: true
                contentWidth: parent.width

                Column{
                    anchors.fill: parent
                    spacing: 5

                    Rectangle{
                        width: parent.width
                        height: 40
                        color: "transparent"

                        Text {
                            text: qsTr("Yeni Dilekçe Gir")
                            anchors.centerIn: parent
                            font.family: "Tahoma"
                            font.pointSize: 14
                            color: "white"
                        }
                    }

                    Row{
                        width: parent.width
                        spacing: 5
                        Rectangle{
                            width: parent.width/2
                            height: componentHeight
                            color: "white"
                            radius: 5
                            Row{
                                anchors.fill: parent
                                TextInput{
                                    id: _dilekceKonu
                                    width: parent.width
                                    height: parent.height
                                    horizontalAlignment: TextInput.AlignHCenter
                                    verticalAlignment: TextInput.AlignVCenter
                                    Text {
                                        text: qsTr("Dilekçe Konusu Giriniz")
                                        color: "gray"
                                        font.bold: false
                                        font.pointSize: 11
                                        font.family: "Tahoma"
                                        visible: !parent.text
                                        anchors.centerIn: parent
                                    }
                                }

                            }
                        }

                        Rectangle{
                            width: parent.width/2
                            height: componentHeight
                            color: "white"
                            radius: 5
                            Row{
                                anchors.fill: parent
                                TextInput{
                                    id: _dilekceSayi
                                    width: parent.width
                                    height: parent.height
                                    horizontalAlignment: TextInput.AlignHCenter
                                    verticalAlignment: TextInput.AlignVCenter
                                    Text {
                                        text: qsTr("Dilekçe Sayısını Giriniz")
                                        color: "gray"
                                        font.bold: false
                                        font.pointSize: 11
                                        font.family: "Tahoma"
                                        visible: !parent.text
                                        anchors.centerIn: parent
                                    }
                                }

                            }
                        }

                    }

                    //TCNO ADSOYAD
                    Row{
                        width: parent.width
                        spacing: 5
                        Rectangle{
                            width: parent.width/2
                            height: componentHeight
                            color: "white"
                            radius: 5
                            clip: true
                            Row{
                                anchors.fill: parent
                                TextInput{
                                    id: tcInput
                                    width: parent.width*4/5
                                    height: parent.height
                                    horizontalAlignment: TextInput.AlignHCenter
                                    verticalAlignment: TextInput.AlignVCenter
                                    Text {
                                        text: qsTr("TC NO Giriniz")
                                        color: "gray"
                                        font.bold: false
                                        font.pointSize: 11
                                        font.family: "Tahoma"
                                        visible: !parent.text
                                        anchors.centerIn: parent
                                    }
                                    onTextChanged: {
                                        if( text.length === 11 )
                                        {
                                            var tcVar = tcManager.loadByTC(text);
                                            if( tcVar )
                                            {
                                                adSoyadInput.text = tcVar.AdSoyad;
                                                telefonNumarasiInput.text = tcVar.CepTelefonu;
                                                tcOid.text = tcVar.tcOid();
                                            }else{
                                                adSoyadInput.text = "";
                                                telefonNumarasiInput.text = "";
                                                tcOid.text = "";
                                            }
                                        }else{
                                            adSoyadInput.text = "";
                                            telefonNumarasiInput.text = "";
                                            tcOid.text = "";
                                        }
                                    }
                                }
                                Rectangle{
                                    width: parent.width/5
                                    height: parent.height
                                    color: "gray"
                                    radius: 5
                                    Text {
                                        text: qsTr("Yeni TC")
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize: 10
                                        anchors.centerIn: parent
                                    }
                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: "PointingHandCursor"
                                        onClicked: {
                                            TCView.loadTCView();
                                        }
                                    }
                                }

                            }
                        }

                        Rectangle{
                            width: parent.width/2
                            height: componentHeight
                            color: "white"
                            radius: 5
                            Row{
                                anchors.fill: parent
                                TextInput{
                                    id: adSoyadInput
                                    enabled: false
                                    width: parent.width
                                    height: parent.height
                                    horizontalAlignment: TextInput.AlignHCenter
                                    verticalAlignment: TextInput.AlignVCenter
                                    Text {
                                        text: qsTr("Ad Soyad Giriniz")
                                        color: "gray"
                                        font.bold: false
                                        font.pointSize: 11
                                        font.family: "Tahoma"
                                        visible: !parent.text
                                        anchors.centerIn: parent
                                    }
                                }

                            }
                        }

                    }

                    Row{
                        width: parent.width
                        spacing: 5
                        Rectangle{
                            width: parent.width/2
                            height: componentHeight
                            color: "white"
                            radius: 5
                            Row{
                                anchors.fill: parent
                                TextInput{
                                    id: telefonNumarasiInput
                                    width: parent.width
                                    height: parent.height
                                    horizontalAlignment: TextInput.AlignHCenter
                                    verticalAlignment: TextInput.AlignVCenter
                                    Text {
                                        text: qsTr("Telefon Numarası Giriniz")
                                        color: "gray"
                                        font.bold: false
                                        font.pointSize: 11
                                        font.family: "Tahoma"
                                        visible: !parent.text
                                        anchors.centerIn: parent
                                    }
                                    onTextChanged: {
                                        if( telefonNumarasiInput.text.length === 11 )
                                        {
                                            var tcVar = tcManager.loadByTel(text);
                                            if( tcVar )
                                            {
                                                adSoyadInput.text = tcVar.AdSoyad;
                                                tcInput.text = tcVar.TCNO;
                                                tcOid.text = tcVar.tcOid();
                                            }else{
                                                adSoyadInput.text = "";
                                                tcInput.text = "";
                                                tcOid.text = "";
                                            }
                                        }else{
                                            adSoyadInput.text = "";
                                            tcInput.text = "";
                                            tcOid.text = "";
                                        }
                                    }
                                }

                            }
                        }

                        Rectangle{
                            width: parent.width/2
                            height: componentHeight
                            color: "white"
                            radius: 5
                            Row{
                                anchors.fill: parent
                                TextInput{
                                    id: tcOid
                                    enabled: false
                                    width: parent.width
                                    height: parent.height
                                    horizontalAlignment: TextInput.AlignHCenter
                                    verticalAlignment: TextInput.AlignVCenter
                                    Text {
                                        text: qsTr("TCOID")
                                        color: "gray"
                                        font.bold: false
                                        font.pointSize: 11
                                        font.family: "Tahoma"
                                        visible: !parent.text
                                        anchors.centerIn: parent
                                    }
                                }
                            }
                        }
                    }

                    Row{
                        width: parent.width
                        spacing: 5
                        Rectangle{
                            width: parent.width/2
                            height: componentHeight
                            color: "white"
                            radius: 5
                            Row{
                                anchors.fill: parent
                                ComboBox{
                                    id: gidecekBirim
                                    width: parent.width
                                    height: parent.height
                                    model: Backend.birimler
                                    Text {
                                        text: qsTr("Gidecek Birimi Seçiniz")
                                        color: "gray"
                                        font.bold: false
                                        font.pointSize: 11
                                        font.family: "Tahoma"
                                        visible: !parent.text
                                        anchors.centerIn: parent
                                    }
                                }
                            }
                        }

                        Rectangle{
                            width: parent.width/2
                            height: componentHeight
                            color: "white"
                            radius: 5
                            Row{
                                anchors.fill: parent
                                ComboBox{
                                    id: icerikTipiID
                                    width: parent.width
                                    height: parent.height
                                    model: ["Numarataj","Büz Koyma","Dal Budama"]

                                    Text {
                                        text: qsTr("İçerik Tipi")
                                        color: "gray"
                                        font.bold: false
                                        font.pointSize: 11
                                        font.family: "Tahoma"
                                        visible: !parent.text
                                        anchors.centerIn: parent
                                    }
                                }

                            }
                        }

                    }

                    Row{
                        width: parent.width
                        spacing: 5
                        Row{
                            width: parent.width/2
                            spacing: 5
                            Rectangle{
                                width: parent.width
                                height: componentHeight
                                color: "white"
                                radius: 5

                                Text {
                                    id: taranmisDilekceText
                                    text: qsTr("Taranmış Dilekçeyi Seçiniz");
                                    color: "gray"
                                    anchors.centerIn: parent
                                    font.pointSize: 10
                                }

                                FileDialog {
                                    id: fileDialog
                                    title: "Please choose a file"
                                    folder: shortcuts.home
                                    onAccepted: {
                                        taranmisDilekceText.text = fileDialog.fileUrl
                                    }
                                    onRejected: {
                                        console.log("Canceled")
                                    }
                                }

                                MouseArea{
                                    anchors.fill: parent
                                    cursorShape: "PointingHandCursor"
                                    onClicked: {
                                        fileDialog.open()
                                    }
                                }
                            }
                        }



                        // EKLER ALANI
                        Row{
                            width: parent.width/2
                            spacing: 5
                            Rectangle{
                                id: ekSelectionMainRect
                                width: parent.width
                                height: yeniDilekceID.ekList.length * (componentHeight+3) + componentHeight
                                color: "white"
                                radius: 5


                                Column{
                                    anchors.fill: parent
                                    spacing: 3
                                    Rectangle{
                                        id: ekSelectionRect
                                        width: parent.width
                                        height: componentHeight
                                        color: "DarkCyan"
                                        radius: 5

                                        Text {
                                            text: qsTr("Ek Varsa Ekleyiniz");
                                            color: "white"
                                            font.bold: true
                                            anchors.centerIn: parent
                                            font.pointSize: 11
                                        }

                                        FileDialog {
                                            id: fileDialogEkler
                                            title: "Please choose a file"
                                            folder: shortcuts.home
                                            onAccepted: {
                                                yeniDilekceID.addEk(fileDialogEkler.fileUrl);
                                            }
                                            onRejected: {
                                                console.log("Canceled")
                                            }
                                        }

                                        MouseArea{
                                            anchors.fill: parent
                                            cursorShape: "PointingHandCursor"
                                            onClicked: {
                                                fileDialogEkler.open()
                                            }
                                        }

                                    }


                                    Repeater{
                                        id: ekListCount
                                        model: yeniDilekceID.ekList;

                                        Rectangle{
                                            width: ekSelectionRect.width
                                            height: componentHeight
                                            Row{
                                                anchors.fill: parent

                                                Rectangle{
                                                    width: parent.width/8*7
                                                    height: componentHeight
                                                    Text {
                                                        text: modelData
                                                        anchors.centerIn: parent
                                                    }
                                                }

                                                Rectangle{
                                                    width: parent.width/8
                                                    height: componentHeight
                                                    color: "darkSlateGray"
                                                    Text {
                                                        text: qsTr("Kaldır")
                                                        anchors.centerIn: parent
                                                        color: "white"
                                                        font.bold: true
                                                    }
                                                    MouseArea{
                                                        cursorShape: "PointingHandCursor"
                                                        anchors.fill: parent
                                                        onClicked: {
                                                            if( yeniDilekceID.deleteEk(modelData) ){
                                                            }
                                                        }
                                                    }
                                                }

                                            }


                                        }

                                    }

                                    Rectangle{
                                        width: parent.width
                                        height: 10

                                    }
                                }




                            }



                        }
                    }

                    Row{
                        width: parent.width
                        spacing: 5
                        Rectangle{
                            width: parent.width
                            height: componentHeight
                            color: "white"
                            radius: 5

                            Row{
                                anchors.fill: parent
                                Rectangle{
                                    width: parent.width/4
                                    height: componentHeight
                                    Text {
                                        id: bilgilendirilecekBirimler
                                        text: qsTr("Bilgilendirilecek Birimler");
                                        color: "gray"
                                        anchors.centerIn: parent
                                        font.pointSize: 11
                                    }
                                }

                                Rectangle{
                                    width: parent.width/2
                                    height: componentHeight
                                    ComboBox{
                                        id: bilgiBirimSelectSource
                                        anchors.fill: parent
                                        model: Backend.birimler
                                    }
                                }

                                Rectangle{
                                    width: parent.width/4
                                    height: componentHeight
                                    color: "DarkCyan"
                                    Text {
                                        text: qsTr("Ekle");
                                        color: "white"
                                        anchors.centerIn: parent
                                        font.pointSize: 11

                                    }

                                    MouseArea{
                                        anchors.fill: parent
                                        cursorShape: "PointingHandCursor"
                                        onClicked: {
                                            yeniDilekceID.addBilgiBirim(bilgiBirimSelectSource.currentText);
                                        }
                                    }
                                }
                            }




                        }
                    }

                    Row{
                        width: parent.width
                        spacing: 5
                        Rectangle{
                            id: bilgiBirimListRect
                            width: parent.width
                            height: yeniDilekceID.bilgiBirim.length * ( componentHeight + 3 )
                            color: "transparent"
                            radius: 5
                            clip: true

                            Column{
                                anchors.fill: parent
                                spacing: 3

                                Repeater{
                                    id: bilgilendirilecekBirimlist
                                    model: yeniDilekceID.bilgiBirim

                                    Rectangle{
                                        width: parent.width
                                        height: componentHeight
                                        color: "transparent"

                                        Row{
                                            anchors.fill: parent

                                            Rectangle{
                                                width: parent.width/8*7
                                                height: componentHeight
                                                color: "transparent"
                                                Text {
                                                    text: modelData
                                                    anchors.centerIn: parent
                                                    color: "white"
                                                    font.bold: true
                                                }
                                            }

                                            Rectangle{
                                                width: parent.width/8
                                                height: componentHeight
                                                color: "red"
                                                Text {
                                                    text: "Kaldır"
                                                    anchors.centerIn: parent
                                                    color: "white"
                                                    font.bold: true
                                                }
                                                MouseArea{
                                                    anchors.fill: parent
                                                    cursorShape: "PointingHandCursor"
                                                    onClicked: {
                                                        yeniDilekceID.deleteBilgiBirim(modelData);
                                                    }
                                                }
                                            }

                                        }


                                    }


                                }


                            }
                        }
                    }

                    Row{
                        width: parent.width
                        spacing: 5
                        Rectangle{
                            width: parent.width
                            height: 400
                            color: "white"
                            radius: 5
                            TextInput{
                                id: icerikID
                                width: parent.width
                                height: parent.height
                                horizontalAlignment: TextInput.AlignLeft
                                verticalAlignment: TextInput.AlignTop
                                wrapMode: Text.Wrap
                                font.pointSize: 11
                                padding: 10
                                Text {
                                    text: qsTr("Dilekçe İçeriğini Buraya Kopyalayınız ( ctrl + v )")
                                    color: "gray"
                                    font.bold: false
                                    font.pointSize: 11
                                    font.family: "Tahoma"
                                    visible: !parent.text
                                    anchors.centerIn: parent
                                }
                            }
                        }
                    }

                    Row{
                        width: parent.width
                        spacing: 5
                        Rectangle{
                            width: parent.width
                            height: componentHeight
                            color: "limegreen"
                            radius: 5

                            Text {
                                text: qsTr("Kaydet")
                                color: "white"
                                font.bold: false
                                font.pointSize: 11
                                font.family: "Tahoma"
                                anchors.centerIn: parent
                            }

                            MouseArea{
                                anchors.fill: parent
                                cursorShape: "PointingHandCursor"
                                onClicked: {
                                    if( taranmisDilekceText.text === "Taranmış Dilekçeyi Seçiniz" )
                                    {
                                        Backend.message = "Taranmış Bir Dilekçeyi Seçmediniz";
                                        return;
                                    }

                                    if( gidecekBirim.currentText === "Başkanlık" )
                                    {
                                        Backend.message = "Gidecek Birimi Seçmediniz";
                                        return;
                                    }

                                    if( _dilekceSayi.text.length === 0 )
                                    {
                                        Backend.message = "Dilekçeye Sayı Vermediniz";
                                        return;
                                    }

                                    if( _dilekceKonu.text.length === 0 )
                                    {
                                        Backend.message = "Dilekçe Konusunu Yazmadınız";
                                        return;
                                    }

                                    if( tcOid.text.length !== 24 )
                                    {
                                        Backend.message = "TC Bilgileri Hatalı";
                                        return;
                                    }

                                    yeniDilekceID.sayi = parseInt(_dilekceSayi.text)
                                    yeniDilekceID.konu = _dilekceKonu.text
                                    yeniDilekceID.birim = gidecekBirim.currentText
                                    yeniDilekceID.icerikTipi = icerikTipiID.currentText
                                    yeniDilekceID.icerik = icerikID.text
                                    yeniDilekceID.tarihJulianDay = Backend.currentJulianDay;
                                    yeniDilekceID.saatMSecStartofDay = Backend.mSecStartOfDay;
                                    yeniDilekceID.tcoid = tcOid.text;
                                    yeniDilekceID.dilekceFilePath = taranmisDilekceText.text;
                                    yeniDilekceID.yil = Backend.currentYil;
                                    yeniDilekceID.ay = Backend.currentAy;
                                    if( dilekceManager.saveDilekce(yeniDilekceID) ){
                                        Backend.message = "Dilekçe Başarılı Bir Şekilde Kayıt Edildi";
                                        yeniDilekcePageID.destroy();
                                    }else{
                                        Backend.message = "Dilekçe Kayıt Edilemedi";
                                    }
                                }
                            }

                        }
                    }

                    Row{
                        width: parent.width
                        spacing: 5
                        Rectangle{
                            width: parent.width
                            height: componentHeight
                            color: "tomato"
                            radius: 5

                            Text {
                                text: qsTr("Kapat")
                                color: "black"
                                font.bold: false
                                font.pointSize: 11
                                font.family: "Tahoma"
                                anchors.centerIn: parent
                            }

                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    yeniDilekcePageID.destroy();
                                }
                            }

                        }
                    }

                }


            }





        }

    }



}
