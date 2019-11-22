import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import "TalepScript.js" as TalepManager
import serik.bel.tr.TalepManagerPage 1.0
import serik.bel.tr.TalepItem 1.0
import serik.bel.tr.TCManagerPage 1.0
import serik.bel.tr.TCItem 1.0
import serik.bel.tr.TalepEvent 1.0
import serik.bel.tr.SMSManager 1.0
import serik.bel.tr.SMSObject 1.0

Item {


    id: talepViewID
    anchors.fill: parent
    property string talepOid
    property TalepItem talepItem
    property TalepManagerPage talepManager: Backend.createTalepManager();
    property TCManagerPage tcManager: Backend.createTCManager();
    property TCItem tcItem
    property TalepEvent talepEvent: TalepEvent{}
    signal updated();


    property SMSManager smsManager: Backend.createSMSManager();
    property SMSObject smsObj : SMSObject{}
    Connections {
        target: smsManager
        onNotify: {
            Backend.message = notifyMSG;
        }
    }

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
                                        text: "AdSoyad: " + ( talepItem.kisiGizli == true ? "Kişi Bilgisi Gizli": tcItem.AdSoyad )
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
                                        text: "Telefon: "+ ( talepItem.kisiGizli == true ? "Kişi Bilgisi Gizli": tcItem.CepTelefonu)
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
                                        text: "Mahalle: " + ( talepItem.kisiGizli == true ? "Kişi Bilgisi Gizli": tcItem.Mahalle)
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
                                        text: "Talep Kanalı: "+talepItem.KaynakStr
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


                        Rectangle{
                            id: smsGonderRectID
                            width: parent.width-parent.padding*2
                            height: 30
                            color: "skyblue"
                            radius: 5
                            layer.enabled: true
                            layer.effect: DropShadow{
                                samples: 6
                                radius: 3
                                color: "black"
                            }

                            Row{
                                anchors.fill: parent

                                Rectangle{
                                    width: parent.width/3*2
                                    height: parent.height
                                    Text {
                                        id: linkTextID
                                        text: "http://www.serik.bel.tr/?type=talep&_id="+talepItem.oid
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
                                    width: parent.width/3
                                    height: parent.height
                                    color: "dimgray"
                                    Text {
                                        text: qsTr("Linki SMS olarak Gönder")
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
                                            smsObj.smsText = "Talebinizi " + linkTextID.text + " Linkinden Takip Edebilirsiniz. İyi Günler Dileriz";
                                            smsObj.numaraText = tcItem.CepTelefonu;

                                            if( smsManager.insertSendSMS(smsObj) ){
                                                talepEvent.Type = TalepEvent.Sms;
                                                talepEvent.talepOid = talepItem.oid;
                                                talepEvent.sms = smsObj.smsText;
                                                talepEvent.personelName = User.adsoyad;
                                                talepEvent.personelOid = User.UserOid;

                                                if( talepManager.insertTalepEvent(talepEvent) )
                                                {

                                                }
                                                talepManager.updateEventList(talepOid);
                                                updated();
                                            }
                                        }
                                    }
                                }

                            }
                        }

                        // Talep Bilgileri
                        Rectangle{
                            id: talepMaininfoRectID
                            width: parent.width-parent.padding*2
                            height: 250
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

                                // Talep/Şikayet Bilgileri Başlığı
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

                                //Görevli Birim
                                Rectangle{
                                    width: parent.width
                                    height: 30
                                    color: "transparent"
                                    border.color: "#4c000000"
                                    Row{
                                        anchors.fill: parent
                                        Rectangle{
                                            width: parent.width * 0.35
                                            height: parent.height
                                            color: "transparent"
                                            Text {
                                                text: qsTr("Görevli Birim")
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
                                            width: parent.width * 0.65
                                            height: parent.height
                                            ComboBox{
                                                id: gorevliBirimComboBox
                                                anchors.fill: parent
                                                model: Backend.birimler
                                                property bool changedProperty: false
                                                Component.onCompleted: {
                                                    updateBirimComboBox();
                                                    changedProperty = true;
                                                }

                                                onCurrentTextChanged: {
                                                    if( changedProperty )
                                                    {
                                                        talepItem.Birim = currentText;
                                                        if( talepManager.updateTalepItem(talepItem) )
                                                        {
                                                            Backend.message = "Birim Değiştirildi."
                                                            updateBirimComboBox();
                                                        }else{
                                                            Backend.message = "! Birim Değiştirilemedi";
                                                        }
                                                    }
                                                }

                                                function updateBirimComboBox(){
                                                    for( var i = 0 ; i < count ; i++ )
                                                    {
                                                        if( textAt(i) === talepItem.Birim )
                                                        {
                                                            currentIndex = i;
                                                            changedProperty = true;
                                                            break;
                                                        }
                                                    }
                                                }
                                            }
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

                                // Resim
                                Rectangle{
                                    id: resimRectID
                                    width: parent.width
                                    color: "transparent"

                                    Image {
                                        id: talepimgID
                                        fillMode: Image.PreserveAspectFit
                                        anchors.fill: parent
                                    }

                                    Component.onCompleted: {
                                        if( talepItem.fotografOid.length == 0 )
                                        {
                                            visible = false;
                                            resimRectID.height = 0;
                                        }else{
                                            var imgUrl = talepManager.downloadFileUrl(talepItem.fotografOid)
                                            talepimgID.source = imgUrl;
                                            resimRectID.height = 250;
                                        }
                                    }

                                }

                                // Konu
                                Rectangle{
                                    id: konuRectTextID
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
                            Component.onCompleted: {

                                if( talepItem.fotografOid.length == 0 )
                                {
                                    resimRectID.height = 5;
                                    talepMaininfoRectID.height = 150 + konuRectTextID.height + resimRectID.height

                                }else{
                                    var imgUrl = talepManager.downloadFileUrl(talepItem.fotografOid)
                                    talepimgID.source = imgUrl;
                                    resimRectID.height = 250;
                                    talepMaininfoRectID.height = 150 + konuRectTextID.height + resimRectID.height

                                }



                                console.log("img Source: " + talepimgID.source + " " + talepimgID.source.length );

                                console.log("Height Of Konu ve Foto: " + talepMaininfoRectID.height );
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
                                TalepEventItem{
                                    id: itemEvent
                                    talepEvent: modelData;
                                    Component.onCompleted: {
                                        parent.color = talepEvent.typeColor;
                                    }
                                }
                                height: itemEvent.height

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
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: {
                            var oldDurum = talepItem.Durum;
                            talepItem.Durum = TalepItem.Tamamlandi;
                            if( talepManager.updateTalepItem(talepItem) )
                            {

                                talepEvent.Type = TalepEvent.Log;
                                talepEvent.talepOid = talepOid;
                                talepEvent.log = "Talep/Şikayet Doğrunlandı ve Tamamlandı.";
                                talepEvent.personelName = User.adsoyad;
                                talepEvent.personelOid = User.UserOid;

                                if( talepManager.insertTalepEvent(talepEvent) )
                                {
                                    Backend.message = "Log Eklendi";
                                    talepManager.updateEventList(talepOid);
                                    updated();
                                }else{
                                    Backend.message = "! Log Eklenemedi";
                                }
                                Backend.message = "Durum Değiştirildi."
                                updated();
                            }else{
                                Backend.message = "Durum Değiştirilemedi";
                                talepItem.Durum = oldDurum;
                            }
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
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: {
                            var oldDurum = talepItem.Durum;
                            talepItem.Durum = TalepItem.RedEdildi;
                            if( talepManager.updateTalepItem(talepItem) )
                            {
                                Backend.message = "Durum Değiştirildi."
                                updated();
                            }else{
                                Backend.message = "Durum Değiştirilemedi";
                                talepItem.Durum = oldDurum;
                            }
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
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: {
                            var oldDurum = talepItem.Durum;
                            talepItem.Durum = TalepItem.DevamEdiyor;
                            if( talepManager.updateTalepItem(talepItem) )
                            {
                                Backend.message = "Durum Değiştirildi."
                                updated();
                            }else{
                                Backend.message = "Durum Değiştirilemedi";
                                talepItem.Durum = oldDurum;
                            }
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
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: {
                            var oldDurum = talepItem.Durum;
                            talepItem.Durum = TalepItem.Beklemede;
                            if( talepManager.updateTalepItem(talepItem) )
                            {
                                Backend.message = "Durum Değiştirildi."
                                updated();
                            }else{
                                Backend.message = "Durum Değiştirilemedi";
                                talepItem.Durum = oldDurum;
                            }
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
                            if( talepItem.Durum === TalepItem.Tamamlandi )
                            {
                                Backend.message = "Bu Talep/Şikayet Tamamlandı. Açıklama Eklemek için Tekrar Açın"
                            }else{
                                var result = TalepManager.loadAciklamaScreen(talepItem.oid);

                                if( result !== null )
                                {
                                    result.updated.connect(function(){
                                        talepManager.updateEventList(talepOid);
                                        updated();
                                    });
                                }else{
                                    Backend.message = "Açıklama Ekranı Yüklenemiyor";
                                }

                            }

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
                                if( talepItem.Durum === TalepItem.Tamamlandi )
                                {
                                    Backend.message = "Bu Talep/Şikayet Tamamlandı. Sms Göndermek için Tekrar Açın"
                                }else{
                                    var result = TalepManager.loadSmsGonderScreen(talepOid)

                                    if( result !== null )
                                    {
                                        result.updated.connect(function(){
                                            talepManager.updateEventList(talepOid);
                                            updated();
                                        });
                                    }else{
                                        Backend.message = "Açıklama Ekranı Yüklenemiyor";
                                    }
                                }
                            }
                        }
                        MenuItem {
                            text: "Fotoğraf Ekle"
                            onClicked: {
                                if( talepItem.Durum === TalepItem.Tamamlandi )
                                {
                                    Backend.message = "Bu Talep/Şikayet Tamamlandı. Fotoğraf Eklemek için Tekrar Açın"
                                }else{
                                    var result = TalepManager.loadFotografEkleScreen(talepOid)
                                    if( result !== null )
                                    {
                                        result.updated.connect(function(){
                                            talepManager.updateEventList(talepOid);
                                            updated();
                                        });
                                    }else{
                                        Backend.message = "Açıklama Ekranı Yüklenemiyor";
                                    }
                                }
                            }
                        }
                        MenuItem {
                            text: "Pdf Ekle"
                            onClicked: {
                                if( talepItem.Durum === TalepItem.Tamamlandi )
                                {
                                    Backend.message = "Bu Talep/Şikayet Tamamlandı. Pdf Eklemek için Tekrar Açın"
                                }else{
                                    var result = TalepManager.loadPdfEkleScreen(talepOid)
                                    if( result !== null )
                                    {
                                        result.updated.connect(function(){
                                            talepManager.updateEventList(talepOid);
                                            updated();
                                        });
                                    }else{
                                        Backend.message = "Açıklama Ekranı Yüklenemiyor";
                                    }
                                }
                            }
                        }
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
