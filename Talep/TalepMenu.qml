import QtQuick 2.13
import QtGraphicalEffects 1.0

Item {


    signal yeniTalepActivated();

    Rectangle{
        width: parent.width
        height: parent.height
        color: "cornflowerblue"

        Row{
            anchors.fill: parent
            Rectangle{
                width: parent.width/2
                height: parent.height
                Text {
                    text: qsTr("Yeni Talep")
                    color: "darkslategray"
                    font.bold: false
                    font.family: "Tahoma"
                    font.pointSize : 11
                    anchors.centerIn: parent
//                    layer.enabled: true
//                    layer.effect: DropShadow{
//                        color: "gray"
//                        radius: 3
//                        samples: 5
//                    }
                }

                MouseArea{
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    onClicked: {
                        yeniTalepActivated();
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height
                Text {
                    text: qsTr("TCNO Listele")
                    color: "darkslategray"
                    font.bold: false
                    font.family: "Tahoma"
                    font.pointSize : 11
                    anchors.centerIn: parent
//                    layer.enabled: true
//                    layer.effect: DropShadow{
//                        color: "gray"
//                        radius: 3
//                        samples: 5
//                    }
                }
            }
        }

        layer.enabled: true
        layer.effect: DropShadow{
            radius: 3
            samples: 5
            color: "black"
        }

    }
}
