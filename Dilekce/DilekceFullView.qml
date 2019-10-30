import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import serik.bel.tr.DilekceItem 1.0
import serik.bel.tr.DilekceManagerPage 1.0
import "../TC"

Item {

    id: dilekceFullViewID
    anchors.fill: parent
    property string dilekceOid
    property DilekceManagerPage dilekceManager: Backend.createDilekceManager();


    Rectangle{
        anchors.leftMargin: 284
        anchors.fill: parent




        TCComponent{
            id: tcRect
            width: parent.width
            height: 43
        }


        ScrollView{


            anchors.fill: parent
            anchors.topMargin: tcRect.height
            anchors.bottomMargin: 30
            clip: true
            contentWidth: parent.width

            Column{
                anchors.fill: parent

                spacing: 3

                Rectangle{
                    width: parent.width
                    height: 40
                    color: "transparent"
                    Flow{
                        anchors.fill: parent
                        width: parent.width
                        spacing: 0

                        Rectangle{
                            width: parent.width/12*6
                            height: 40
                            color: "darkslategray"
                            Text {
                                id: dilekceKonuTextID
                                text: qsTr("Konu")
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
                        }

                        Rectangle{
                            width: parent.width/12*1
                            height: 40
                            color: "steelblue"
                            Text {
                                id: dilekceSayiTextID
                                text: qsTr("Sayı")
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
                        }
                        Rectangle{
                            width: parent.width/12*2
                            height: 40
                            color: "lightsteelblue"
                            Text {
                                id: dilekceTarihTextID
                                text: qsTr("Tarih")
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
                        }
                        Rectangle{
                            width: parent.width/12*3
                            height: 40
                            color: "steelblue"
                            Text {
                                id: dilekceIcerikTipID
                                text: qsTr("İçerik Tipi")
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
                        }



                    }
                }

//                Repeater{
//                    model: 20
//                    anchors.fill: parent
//                    anchors.topMargin: 40
//                    Rectangle{
//                        width: parent.width
//                        height: 50
//                        color: "red"
//                    }
//                }
            }
        }





        Rectangle{
            color: "lightslategray"
            width: parent.width
            height: 30
            anchors.bottom: parent.bottom


            Text {
                text: qsTr("Kapat")
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
                cursorShape: "PointingHandCursor"
                anchors.fill: parent
                onClicked: {
                    dilekceFullViewID.destroy();
                }
            }

        }

    }




    Component.onCompleted: {
        var dilekceitem = dilekceManager.loadByOid(dilekceOid);
        if( dilekceitem )
        {
            tcRect.tcoid = dilekceitem.tcoid;
            tcRect.initTCComponent();

            dilekceKonuTextID.text = dilekceitem.konu;
            dilekceSayiTextID.text = dilekceitem.sayi;
            dilekceTarihTextID.text = dilekceitem.tarihText;
            dilekceIcerikTipID.text = dilekceitem.icerikTipi;
        }else{
            Backend.message = "Dilekçe Bilgileri Yüklenemedi";
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:720;width:1280}
}
##^##*/
