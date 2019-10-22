import QtQuick 2.13
import serik.bel.tr.DilekceGirisPage 1.0
import "DilekceScripts.js" as Dilekce

Item {

    anchors.fill: parent
    anchors.topMargin: 30
    anchors.leftMargin: 284


    DilekceGirisBackend{
        id: dilekceGirisBackend
    }


    Rectangle{
        width: parent.width
        height: parent.height
        color: "transparent"
        anchors.centerIn: parent


        Rectangle{
            color: "white"
            width: 100
            height: 100
            anchors.centerIn: parent
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    Dilekce.loadYeniDilekcePage();
                }
            }
        }
    }

}
