import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0
import serik.bel.tr.DilekceManagerPage 1.0

Item {

    id: dilekceKategoriRoot
    anchors.fill: parent
    property int itemWidth: Backend.itemWidth(width,4,6,6,12,12);
    property DilekceManagerPage dilekceManager: Backend.createDilekceManager();


    Rectangle{
        anchors.fill: parent


        Column{
            anchors.fill: parent

            Rectangle{
                width: parent.width
                height: 35
                color: "transparent"

                Row{
                    anchors.fill: parent
                    Rectangle{
                        width: parent.width/2
                        height: parent.height
                        TextInput{
                            id: yeniKategoriTextinputID
                            width: parent.width
                            height: parent.height
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            wrapMode: TextInput.WordWrap
                            Text {
                                text: qsTr("Kategori Adını Giriniz")
                                color: "gray"
                                font.bold: true
                                font.family: "Tahoma"
                                font.pointSize : 9
                                anchors.centerIn: parent
                                visible: !parent.text
                            }
                        }
                    }

                    Rectangle{
                        width: parent.width/2
                        height: parent.height
                        color: "dimgray"
                        Text {
                            text: qsTr("Ekle")
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
                                console.log("Kategori Ekle");
                                dilekceManager.insertYeniKategori(yeniKategoriTextinputID.text);
                            }
                        }
                    }
                }
            }


            Rectangle {
                id: kategoriListID
                width: parent.width
                height: parent.height-70
                anchors.topMargin: 35
                anchors.bottomMargin: 35
                color: "transparent"

                ScrollView {
                    anchors.fill : parent
                    clip : true

                    Flow{
                        width : parent.parent.width
                        Repeater{
                            model: dilekceManager.kategoriList
                            Rectangle{
                                width: itemWidth
                                height: 40
                                anchors.margins: 1

                                Row{
                                    anchors.fill: parent
                                    spacing: 0
                                    anchors.margins: 1
                                    Rectangle{
                                        anchors.margins: 5
                                        width: parent.width/8*7
                                        height: parent.height
                                        color: "steelblue"
                                        Text {
                                            text: modelData
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
                                        anchors.margins: 5
                                        width: parent.width/8
                                        height: parent.height
                                        color: "crimson"
                                        Text {
                                            text: "X"
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
                                                dilekceManager.deleteKategori(modelData)
                                            }
                                        }
                                    }


                                }


                                color: "transparent"
                            }
                        }

                    }
                }
            }





            Rectangle{
                width: parent.width
                height: 35

                color: "darkgray"

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
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    onClicked: {
                        dilekceKategoriRoot.destroy();
                    }
                }
            }

        }


    }








}
