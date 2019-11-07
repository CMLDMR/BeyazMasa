import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import serik.bel.tr.TalepItem 1.0

Item {


    property TalepItem talepItem

    width: parent.width < 600 ? parent.width : (parent.width < 1000 ? parent.width/2-5 : (parent.width < 1500 ? parent.width/3-5 : parent.width/4-5))
    height: 50
    Rectangle{
        width: parent.width
        height:parent.height
        radius: 5
        border.color: "#000000"
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
//        opacity: 0.5
        layer.enabled: true
        layer.effect: DropShadow{
            samples: 6
            radius: 3
            color: "black"
        }

        Row{
            anchors.fill: parent

            Rectangle{
                color: "transparent"
                width: parent.width/2
                height: parent.height
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
                    opacity: 1.0
                }
            }

            Rectangle{
                color: "transparent"
                width: parent.width/2
                height: parent.height
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
                    opacity: 1.0
                }
            }

        }


    }

}
