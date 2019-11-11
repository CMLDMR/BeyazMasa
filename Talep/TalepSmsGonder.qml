import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import "TalepScript.js" as TalepManager
import serik.bel.tr.TalepManagerPage 1.0
import serik.bel.tr.TalepItem 1.0
import serik.bel.tr.TalepEvent 1.0

Item {

    anchors.fill: parent
    id: aciklamaEkleDialogID
    property string talepOid
    property TalepEvent talepEvent: TalepEvent{}
    property TalepManagerPage talepManager: Backend.createTalepManager();

    Rectangle
    {
        id: aciklamaEkleRectID
        width: 0
        height: parent.height
        color: "green"
        anchors.centerIn: parent
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#cc004480"
            }
            GradientStop {
                position: 1.00;
                color: "#f0ffffff";
            }
        }

        Column{
            anchors.fill: parent
            spacing: 3

            Rectangle{
                width: parent.width
                height: 40
                color: "#80ffffff"
                layer.enabled: true
                layer.effect: DropShadow{
                    samples: 6
                    radius: 3
                    color: "black"
                }

                Text {
                    text: qsTr("Sms Gönder")
                    color: "white"
                    font.bold: false
                    font.family: "Tahoma"
                    font.pointSize : 12
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
                width: parent.width
                height: parent.height-130
                color: "transparent"
                TextInput{
                    id: aciklamainputTextID
                    padding: 15
                    width: parent.width
                    height: parent.height
                    color: "white"
                    font.bold: true
                    font.family: "Tahoma"
                    wrapMode: TextInput.WordWrap



                    Text {
                        id: smsbualanagirinizID
                        text: qsTr("Sms Bu Alana Giriniz ( Max 160 Karakter )")
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

                    onTextChanged: {
                        if( aciklamainputTextID.text.length > 160 )
                        {
                            smsbualanagirinizID.text = "Geçersiz Metin Uzunluğu. Karakter: " + text.length + " .Max 160 Karakter";
                            smsbualanagirinizID.color = "red"
                            smsbualanagirinizID.opacity = 1.0
                            smsbualanagirinizID.font.pointSize = 12
                        }else{
                            if( aciklamainputTextID.text.length === 0 )
                            {
                                smsbualanagirinizID.text = "Sms Bu Alana Giriniz. Karakter: " + text.length + " .Max 160 Karakter";
                                smsbualanagirinizID.color = "white"
                                smsbualanagirinizID.opacity = 1.0
                                smsbualanagirinizID.font.pointSize = 9
                            }else{
                                smsbualanagirinizID.text = "Sms Bu Alana Giriniz. Karakter: " + text.length + " .Max 160 Karakter";
                                smsbualanagirinizID.color = "white"
                                smsbualanagirinizID.opacity = 0.5
                                smsbualanagirinizID.font.pointSize = 9
                            }


                        }

                    }
                }
            }

            Rectangle{
                width: parent.width
                height: 40
                color: "dimgray"
                Text {
                    text: qsTr("Sms Gönder")
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

                        if( aciklamainputTextID.text.length > 160 )
                        {
                            Backend.message = "160 Karakterden Büyük SMS Atamazsınız";
                            return;
                        }

                        talepEvent.Type = TalepEvent.Sms;
                        talepEvent.talepOid = talepOid;
                        talepEvent.sms = aciklamainputTextID.text;
                        talepEvent.personelName = User.adsoyad;
                        talepEvent.personelOid = User.UserOid;

                        if( talepManager.insertTalepEvent(talepEvent) )
                        {
                            Backend.message = "Sms Gönderildi";
                            closeUpAciklamaEkleDialog.start();
                        }else{
                            Backend.message = "! Sms Gönderilemedi";
                        }


                    }
                }

            }

            Rectangle{
                width: parent.width
                height: 40
                color: "coral"
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
                        closeUpAciklamaEkleDialog.start();
                    }
                }
            }


        }
    }


    Component.onCompleted: {
        openUpAciklamaEkleDialog.start();
    }

    PropertyAnimation{
        id: openUpAciklamaEkleDialog
        target: aciklamaEkleRectID
        property: "width"
        from: 0
        to: aciklamaEkleDialogID.width
        duration: 350
    }

    PropertyAnimation{
        id: closeUpAciklamaEkleDialog
        target: aciklamaEkleRectID
        property: "width"
        to: 0
        from: aciklamaEkleDialogID.width
        duration: 350
        onStopped: {
            aciklamaEkleDialogID.destroy();
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:720;width:1280}
}
##^##*/
