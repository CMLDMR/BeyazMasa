import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13

import serik.bel.tr.BilgiEdinmeManagerPage 1.0
import serik.bel.tr.BilgiEdinmeValue 1.0

Item {

    id: bilgiEdinmeSayfasiID
    anchors.fill: parent

    property BilgiEdinmeManagerPage bilgiEdinmeManager: Backend.createBilgiEdinmeManager();



    Rectangle{
        anchors.fill: parent
        color: "#AAff00ff"


        Column{
            anchors.fill: parent

            Rectangle{
                width:parent.width
                height: 40
                layer.enabled: true
                layer.effect: DropShadow{
                    samples: 12
                    radius: 6
                    color: "black"
                }
                color: "dimGray"

                Text {
                    text: qsTr("Bilgi Edinme Başvuruları")
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

            Rectangle {
                id: itemID
                width: parent.width
                height: parent.height-120

                ScrollView {
                    anchors.fill : parent
                    clip : true

                    Flow{
                        width : parent.parent.width


                        Repeater{
                            id: bilgiEdinmeRepeaterModelID
                            model: bilgiEdinmeManager.list
                            Rectangle{
                                width: Backend.itemWidth(itemID.width,2,3,4,6,12);
                                height: 120
                                color: "white"
                                BilgiEdinmeValueListItem{
                                    anchors.fill: parent
                                    value : modelData
                                    onBilgiEdinmeOid: {
                                        loadBilgiEdinme(value.oid)
                                    }
                                }
                            }
                        }
                    }
                }
            }


            Rectangle{
                width:parent.width
                height: 40
                layer.enabled: true
                color: "#1f5684"
                layer.effect: DropShadow{
                    samples: 12
                    radius: 6
                    color: "black"
                }

                Row{
                    anchors.fill: parent

                    Rectangle{
                        width: parent.width/3
                        height: 40
                        color: "transparent"
                        Text {
                            text: qsTr("Geri")
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
                                bilgiEdinmeManager.back();
                            }
                        }

                    }

                    Rectangle{
                        width: parent.width/3
                        height: 40
                        color: "transparent"
                        Text {
                            text: bilgiEdinmeManager.currentPage
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
                        width: parent.width/3
                        height: 40
                        color: "transparent"
                        Text {
                            text: qsTr("İleri")
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
                                bilgiEdinmeManager.next();
                            }
                        }
                    }
                }
            }

            // Kontrol Menü
            Rectangle{
                width:parent.width
                height: 40
                layer.enabled: true
                color: "steelblue"
                layer.effect: DropShadow{
                    samples: 12
                    radius: 6
                    color: "black"
                }
//                color: "gray"

                Row{
                    anchors.fill: parent

                    Rectangle{
                        width: parent.width/4
                        height: 40
                        color: "transparent"
                        Text {
                            text: qsTr("Bekleyenler")
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
                                bilgiEdinmeManager.bekleyenler();
                            }
                        }

                    }

                    Rectangle{
                        width: parent.width/4
                        height: 40
                        color: "transparent"
                        Text {
                            text: qsTr("Cevaplanmayanlar")
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
                                bilgiEdinmeManager.cevaplanmayanlar();
                            }
                        }
                    }

                    Rectangle{
                        width: parent.width/4
                        height: 40
                        color: "transparent"
                        Text {
                            text: qsTr("Cevaplananlar")
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
                                bilgiEdinmeManager.cevaplananlar();
                            }
                        }
                    }

                    Rectangle{
                        width: parent.width/4
                        height: 40
                        color: "crimson"
                        Text {
                            text: qsTr("Çık")
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
                                bilgiEdinmeSayfasiID.destroy();
                            }
                        }
                    }

                }




            }



        }


    }




    function loadBilgiEdinme(bilgiEdinmeOid)
    {
        var component = Qt.createComponent("qrc:/BilgiEdinme/BilgiEdinmeViewPage.qml");
        if (component.status === Component.Ready) {
            var bilgiValue = bilgiEdinmeManager.valueAt(bilgiEdinmeOid);
            var sprite = component.createObject(appWindow,{value:bilgiValue});
            if (sprite === null) {
                Backend.message = "Başvuru Görüntülenemiyor";
            }else{
                sprite.updated.connect(updateList);
            }
        } else if (component.status === Component.Error) {
            Backend.message = "Başvuru Yükleme Hatası: " + component.errorString();
        }
    }


    function updateList(){
        bilgiEdinmeManager.refreshList();
    }



}
