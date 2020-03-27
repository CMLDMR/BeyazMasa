import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import serik.bel.tr.TalepItem 1.0
import serik.bel.tr.TalepKateogoriManagerPage 1.0

Item {


    signal clickTalep(string talepoid)
    property TalepItem talepItem
    property TalepKateogoriManagerPage talepKategoriManager: Backend.createTalepKategoriManager()

    width: parent.width //< 600 ? parent.width : (parent.width < 1000 ? parent.width/2-5 : (parent.width < 1500 ? parent.width/3-5 : parent.width/4-5))
    height: 40
    Rectangle{
        width: parent.width
        height:parent.height
        radius: 3
        border.color: "#000000"
        clip: true
        gradient: Gradient {
            GradientStop {
                position: 0.88;
                color: "#80aed7e1";
            }
            GradientStop {
                position: 1.00;
                color: "#80946666";
            }
        }


        Row{
            anchors.fill: parent

            Rectangle{
                color: "transparent"
                width: parent.width/5
                height: parent.height
                Text {
                    text: talepItem.tarih
                    color: "white"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize : 9
                    anchors.centerIn: parent
                    opacity: 1.0
                }
            }

            Rectangle{
                color: "transparent"
                width: parent.width/5
                height: parent.height
                Text {
                    text: talepItem.mahalle
                    color: "white"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize : 9
                    anchors.centerIn: parent
                    opacity: 1.0
                }
            }

            Rectangle{
                color: talepItem.DurumColor
                width: parent.width/5
                height: parent.height
                id: durumRectID
                radius: 3
                opacity: 0.85
                Text {
                    text: talepItem.DurumStr
                    color: "white"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize : 9
                    anchors.centerIn: parent
                    opacity: 1.0
                }
            }

            Rectangle{
                width: parent.width/5
                height: parent.height
                id: kateogoriRectID
                radius: 3
                opacity: 0.85
                property string kategoriName: talepKategoriManager.kategoriName(talepItem.kategoriOid)
                Text {
                    text: parent.kategoriName
                    color: "white"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize : 9
                    anchors.centerIn: parent
                    opacity: 1.0
                }
                color: kategoriName !== "Covid-19" ? talepItem.DurumColor : "red"
            }

            Rectangle{
                color: talepItem.DurumColor
                width: parent.width/5
                height: parent.height
                id: birimRect
                radius: 3
                opacity: 0.85
                Text {
                    text: talepItem.Birim
                    color: "white"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize : 9
                    anchors.centerIn: parent
                    opacity: 1.0
                }
            }
        }
    }


    MouseArea{
        anchors.fill: parent
        cursorShape: "PointingHandCursor"
        onClicked: {
            clickTalep(talepItem.oid);
        }
    }

}
