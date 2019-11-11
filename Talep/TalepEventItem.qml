import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import serik.bel.tr.TalepEvent 1.0

Item {

    anchors.fill: parent
    property TalepEvent talepEvent



    Rectangle{
        anchors.fill: parent
        color: "transparent"

        Text {
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

            Component.onCompleted: {
                if( talepEvent.Type === TalepEvent.Aciklama )
                {
                    aciklamaAdText.text = talepEvent.Aciklama
                }
                if( talepEvent.Type === TalepEvent.Sms )
                {
                    aciklamaAdText.text = talepEvent.sms
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

}
