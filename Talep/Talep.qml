import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import "TalepScript.js" as TalepManager
import serik.bel.tr.TalepManagerPage 1.0

Item {


    anchors.fill: parent
    id: talepitemID
    anchors.leftMargin: 284
    anchors.topMargin: 30

    property TalepManagerPage talepManeger: Backend.createTalepManager();

    Rectangle{
        width: parent.width
        height: parent.height
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
            anchors.bottomMargin: 55
            spacing: 5


            TalepMenu{
                width: parent.width
                height: 50
                onYeniTalepActivated: {
                    TalepManager.loadYeniTalepPage();
                }

                onTcnoCompleted: {
                    print("TCNO Tamamlandı: "+tcno);
                }
            }

            Rectangle{
                width: parent.width
                height: parent.height-50
                color: "transparent"


                ScrollView{
                    width: parent.width
                    height: parent.height
                    clip: true
                    contentWidth: width

                    Flow{
                        anchors.fill: parent
                        spacing: 5

                        Repeater{
                            id: talepListRepeaterID
                            model: talepManeger.list
                            anchors.fill: parent
                            TalepListItem{
                                talepItem: modelData
                            }
                        }
                    }
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


    Component.onCompleted: {
        talepManeger.find();
    }







}
