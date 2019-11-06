import QtQuick 2.13
import QtGraphicalEffects 1.0
import "TalepScript.js" as TalepManager

Item {


    anchors.fill: parent
    id: talepitemID
    anchors.leftMargin: 284
    anchors.topMargin: 30

    Rectangle{
        anchors.fill: parent
        color: "#7df9fd"
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#499fa0";
            }
            GradientStop {
                position: 1.00;
                color: "#292929";
            }
        }





        Column{
            anchors.fill: parent
            spacing: 5


            TalepMenu{
                width: parent.width
                height: 50

                onYeniTalepActivated: {
                    TalepManager.loadYeniTalepPage();
                }
            }




        }

        Rectangle{
            width: parent.width
            height: 50
            anchors.bottom: parent.bottom
            Text {
                text: qsTr("Kapat")
                color: "black"
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
                    talepitemID.destroy();
                }
            }
        }

    }







}
