import QtQuick 2.13
import serik.bel.tr.TCItem 1.0

Item {




    property TCItem tcItem


    Rectangle{
        width: parent.width
        height: parent.height
        color: "transparent"

        Rectangle{
            anchors.fill: parent
            anchors.margins: 1
            color: "steelblue"

            Column{
                anchors.fill: parent

                Text {
                    text: tcItem.TCNO
                    color: "white"
                    font.bold: false
                    font.family: "Tahoma"
                    font.pointSize : 8
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                }

                Text {
                    text: tcItem.AdSoyad
                    color: "white"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize : 9
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                }

                Text {
                    text: tcItem.CepTelefonu
                    color: "white"
                    font.bold: false
                    font.family: "Tahoma"
                    font.italic: true
                    font.pointSize : 8
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                }
            }


        }
    }



}
