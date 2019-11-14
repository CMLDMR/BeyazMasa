import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import serik.bel.tr.TalepEvent 1.0

Item {

//    anchors.fill: parent
    width: parent.width
    height: aciklamaAdText.height > fotoid.height ? aciklamaAdText.height+25 : fotoid.height
    property TalepEvent talepEvent
    id: eventItemID



    Rectangle{
        anchors.fill: parent
        color: "transparent"

        Text {
            id: logid
            text: talepEvent.personelName + " / " + talepEvent.tarih + " " + talepEvent.saat +" -- " + talepEvent.TypeStr
            color: "white"
            font.bold: false
            font.family: "Tahoma"
            font.pointSize : 9
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            layer.enabled: true
            layer.effect: DropShadow{
                color: "black"
                radius: 3
                samples: 5
            }
        }

        Text {
            id: aciklamaAdText
            padding: 5
            anchors.top: logid.bottom
            color: "white"
            font.bold: true
            font.family: "Tahoma"
            font.pointSize : 9
            anchors.centerIn: parent
            textFormat: Text.RichText
            width: parent.width
            wrapMode: Text.WordWrap
            layer.enabled: true
            layer.effect: DropShadow{
                color: "black"
                radius: 3
                samples: 5
            }

            Component.onCompleted: {
                if( talepEvent.Type === TalepEvent.Aciklama )
                {
                    aciklamaAdText.text = talepEvent.Aciklama
                }
                if( talepEvent.Type === TalepEvent.Sms )
                {
                    aciklamaAdText.text = talepEvent.sms
                }
                if( talepEvent.Type === TalepEvent.Log )
                {
                    aciklamaAdText.text = talepEvent.log
                }


            }

        }

        Image {
            id: fotoid
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
            property string pdfurl
            Component.onCompleted: {
                if( talepEvent.Type === TalepEvent.Fotograf )
                {
                    fotoid.source = talepManager.downloadFileUrl(talepEvent.FotoOid)
                }

                if( talepEvent.Type === TalepEvent.Pdf )
                {
                    fotoid.source = "qrc:/file/icon/adobe-acrobat-pdf-file-document-512.png"
                    fotoid.pdfurl = talepManager.downloadFileUrl(talepEvent.PdfOid)
                }

                if( talepEvent.Type === TalepEvent.Pdf  || talepEvent.Type === TalepEvent.Fotograf )
                {
                    fotoid.height = 100
                }else{
                    fotoid.height = 0
                }

            }
            MouseArea{
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                onDoubleClicked: {
                    if( talepEvent.Type === TalepEvent.Fotograf )
                    {
                        Qt.openUrlExternally(parent.source);
                    }

                    if( talepEvent.Type === TalepEvent.Pdf )
                    {
                        Qt.openUrlExternally(parent.pdfurl);
                    }
                }
            }
        }
    }

    Component.onCompleted: {
        console.log("fotoheight: " + fotoid.height );
        console.log("aciklamaheight: " + aciklamaAdText.height );
        console.log("Height: " + height );
    }



}
