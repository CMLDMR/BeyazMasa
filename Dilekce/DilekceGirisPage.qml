import QtQuick 2.13
import serik.bel.tr.DilekceGirisPage 1.0


Item {

    anchors.fill: parent
    anchors.topMargin: 30


    DilekceGirisBackend{
        id: dilekceGirisBackend
    }


    Rectangle{
        width: parent.width > 1280 ? 1280 : parent.width
        height: parent.height
        color: "red"
        anchors.centerIn: parent


        Rectangle{
            color: "white"
            width: 100
            height: 100
            anchors.centerIn: parent
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    var dilekce = dilekceGirisBackend.createYeniDilekce();

                }
            }
        }
    }

}
