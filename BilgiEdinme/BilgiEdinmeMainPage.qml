import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13

import serik.bel.tr.BilgiEdinmeManagerPage 1.0
import serik.bel.tr.BilgiEdinmeValue 1.0

Item {

    anchors.fill: parent

    property BilgiEdinmeManagerPage bilgiEdinmeManager: Backend.createBilgiEdinmeManager();


    Rectangle{
        anchors.fill: parent
        color: "#AAff00ff"







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


                    Repeater{
                        model: bilgiEdinmeManager.list
                        Rectangle{
                            width: Backend.itemWidth(itemID.width,2,3,4,6,12);
                            height: 100
                            color: "white"
                            BilgiEdinmeValueListItem{
                                anchors.fill: parent
                                value : modelData
                            }
                        }
                    }



                }
            }
        }

    }



    MouseArea{
        anchors.fill: parent
    }

}
