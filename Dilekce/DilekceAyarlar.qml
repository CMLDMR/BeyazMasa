import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0
import serik.bel.tr.DilekceManagerPage 1.0
import "DilekceScripts.js" as Dilekce

Item {

    id: dilekceayarRoot
    anchors.fill: parent
    property int itemWidth: Backend.itemWidth(width,2,2,3,4,12);
    property DilekceManagerPage dilekceManager: Backend.createDilekceManager();


    Rectangle{
        anchors.fill: parent
        color: "#99979797"
        MouseArea{
            anchors.fill: parent
        }

        Rectangle {
            id: itemID
            width: parent.width
            height: parent.height
            anchors.centerIn : parent

            ScrollView {
                anchors.fill : parent
                clip : true

                Flow{
                    width : parent.parent.width
                    Rectangle{
                        width: dilekceayarRoot.itemWidth
                        height: 50
                        color: "dimGray"

                        Text {
                            text: qsTr("Kategoriler")
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
                                Dilekce.loadDilekceKategoriPage();
                            }
                        }
                    }


                }
            }
        }




    }

}
