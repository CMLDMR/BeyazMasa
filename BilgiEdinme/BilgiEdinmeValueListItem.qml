import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13

import serik.bel.tr.BilgiEdinmeManagerPage 1.0
import serik.bel.tr.BilgiEdinmeValue 1.0


Item {

    property BilgiEdinmeValue value

    signal bilgiEdinmeOid(string oid)


    Rectangle{
        anchors.fill: parent
        clip: true
        border.color: "dimgray"
        radius: 3
        layer.enabled: true
        layer.effect: DropShadow{
            samples: 15
            radius: 8
            verticalOffset: 1
            color: "gray"
        }

        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: 0.00;
                color: "#000000";
            }
            GradientStop {
                position: 0.47;
                color: "#3a3939";
            }
            GradientStop {
                position: 1.00;
                color: "#000000";
            }
        }
        anchors.margins: 5
        Column{
            anchors.fill: parent

            Rectangle{
                width: parent.width
                height: parent.height/4
                color: "transparent"
                Text {
                    text: value.birim
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
                    width: parent.width
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            Rectangle{
                width: parent.width
                height: parent.height/4
                color: "transparent"
                Text {
                    text: value.tarih
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
                    width: parent.width
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            Rectangle{
                width: parent.width
                height: parent.height/4
                color: "transparent"
                Text {
                    text: value.saat
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
                    width: parent.width
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            Rectangle{
                width: parent.width
                height: parent.height/4
                color: "transparent"
                Text {
                    text: value.konu
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
                    width: parent.width
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                }
            }

        }


        MouseArea{
            cursorShape: "PointingHandCursor"
            anchors.fill: parent
            onClicked: {
                console.log("Bilgi Edinme Log");
                bilgiEdinmeOid(value.oid)
            }
        }


    }




}
