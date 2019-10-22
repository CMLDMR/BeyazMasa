import QtQuick 2.13
import QtQuick.Controls 2.13
import QtGraphicalEffects 1.0
import serik.bel.tr.DilekceManagerPage 1.0

Item {

    anchors.fill: parent
    anchors.topMargin: 30
    id: dilekceListItem

    property DilekceManagerPage dilekceManager: DilekceManagerPage{}



    MouseArea{
        anchors.fill: parent
    }


    Rectangle{
        color: "red"
        anchors.leftMargin: 284
        anchors.fill: parent

        Rectangle{
            color: "green"
            width: parent.width
            height: 30
            anchors.top: parent.top
            id: screenTitleRect
            Text {
                text: qsTr("Dilekçe Sorgulama Ekranı")
                color: "white"
                font.bold: true
                anchors.centerIn: parent
                font.family: "Tahoma"
                font.pointSize: 12
                layer.enabled: true
                layer.effect: DropShadow{
                    color: "black"
                    radius: 3
                    samples: 5
                }
            }
        }


        Rectangle{
            anchors.top: screenTitleRect.bottom
            width: parent.width
            height: 60
            color: "orange"
            id: sorguEkraniRectID
            property int rectDivider: 5
            layer.enabled: true
            layer.effect: DropShadow{
                samples: 8
                radius: 8
                color: "black"
            }
            z: 10
            radius: 3
            clip: true

            Row{
                anchors.fill: parent
                spacing: 0


                Rectangle{
                    color: "slategray"
                    width: parent.width/sorguEkraniRectID.rectDivider
                    height: parent.height
                    TextInput{
                        id: byTelefonNumrasiInputID
                        width: parent.width
                        height: parent.height
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Tahoma"
                        font.pointSize: 9
                        font.bold: true
                        color: "white"
                        Text {
                            text: qsTr("Telefon ile Sorgulama")
                            anchors.centerIn: parent
                            color: "white"
                            opacity: 0.5
                            font.bold: true
                            font.family: "Tahoma"
                            font.pointSize: 9
                            visible: !parent.text
                        }

                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }


                Rectangle{
                    color: "darkcyan"
                    width: parent.width/sorguEkraniRectID.rectDivider
                    height: parent.height
                    TextInput{
                        width: parent.width
                        height: parent.height
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Tahoma"
                        font.pointSize: 9
                        font.bold: true
                        color: "white"
                        Text {
                            text: qsTr("Telefon ile Sorgulama")
                            anchors.centerIn: parent
                            color: "white"
                            opacity: 0.5
                            font.bold: true
                            font.family: "Tahoma"
                            font.pointSize: 9
                            visible: !parent.text
                        }

                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }


                }


                Rectangle{
                    color: "seagreen"
                    width: parent.width/sorguEkraniRectID.rectDivider
                    height: parent.height
                    TextInput{
                        width: parent.width
                        height: parent.height
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Tahoma"
                        font.pointSize: 9
                        font.bold: true
                        color: "white"
                        Text {
                            text: qsTr("Ad Soyad ile Sorgulama")
                            anchors.centerIn: parent
                            color: "white"
                            opacity: 0.5
                            font.bold: true
                            font.family: "Tahoma"
                            font.pointSize: 9
                            visible: !parent.text
                        }

                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }

                Rectangle{
                    color: "dimgray"
                    width: parent.width/sorguEkraniRectID.rectDivider
                    height: parent.height
                    TextInput{
                        width: parent.width
                        height: parent.height
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Tahoma"
                        font.pointSize: 9
                        font.bold: true
                        color: "white"
                        Text {
                            text: qsTr("Sayı ile Sorgulama")
                            anchors.centerIn: parent
                            color: "white"
                            opacity: 0.5
                            font.bold: true
                            font.family: "Tahoma"
                            font.pointSize: 9
                            visible: !parent.text
                        }

                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }

                Rectangle{
                    color: "cadetblue"
                    width: parent.width/sorguEkraniRectID.rectDivider
                    height: parent.height
                    Text {
                        text: qsTr("Sorgula")
                        anchors.centerIn: parent
                        color: "white"
                        opacity: 1
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize: 9
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
                            dilekceManager.dilekceListByTelefon(byTelefonNumrasiInputID.text);
                        }
                    }


                }
            }
        }

        Rectangle{
            id: dilekceListesiRectID
            width: parent.width
            anchors.top: sorguEkraniRectID.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30
            color: "darkslategray"
            clip: true
            ScrollView{
                anchors.fill: parent
                clip: true
                contentWidth: parent.width
                Column{
                    anchors.fill: parent
                    spacing: 2
                    Repeater{
                        id: dilekceListModel
                        model: dilekceManager.dilekceList
                        width: parent.width
                        Rectangle{
                            width: parent.width
                            height: 40
                            color: "fuchsia"
                            Row{
                                anchors.fill: parent
                                Rectangle{
                                    width: parent.width/sorguEkraniRectID.rectDivider
                                    height: parent.height
                                    color: "coral"
                                    Text {
                                        text: modelData.konu
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle{
                                    width: parent.width/sorguEkraniRectID.rectDivider
                                    height: parent.height
                                    color: "slategray"
                                    Text {
                                        text: modelData.sayi
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle{
                                    width: parent.width/sorguEkraniRectID.rectDivider
                                    height: parent.height
                                    color: "dimgray"
                                    Text {
                                        text: modelData.tarihText
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle{
                                    width: parent.width/sorguEkraniRectID.rectDivider
                                    height: parent.height
                                    color: "blueviolet"
                                    Text {
                                        text: modelData.birim
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                    }
                                }
                                Rectangle{
                                    width: parent.width/sorguEkraniRectID.rectDivider
                                    height: parent.height
                                    color: "sienna"
                                    Text {
                                        text: qsTr("Cevap Yok")
                                        color: "white"
                                        font.bold: true
                                        font.family: "Tahoma"
                                        font.pointSize : 9
                                        anchors.centerIn: parent
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        Rectangle{
            width: parent.width
            height: dilekceListesiRectID.anchors.bottomMargin
            color: "steelblue"
            anchors.top: dilekceListesiRectID.bottom
            layer.enabled: true
            layer.effect: DropShadow{
                samples: 8
                radius: 8
                color: "black"
            }

            Row{
                anchors.fill: parent
                Rectangle{
                    width: parent.width/4
                    height: parent.height
                    color: "skyblue"
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
                            dilekceListItem.destroy()
                        }
                    }
                }
                Rectangle{
                    width: parent.width/4
                    height: parent.height
                    color: "teal"
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

                        }
                    }
                }
                Rectangle{
                    width: parent.width/4
                    height: parent.height
                    color: "mediumslateblue"
                    Text {
                        text: qsTr("1/20")
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
                    width: parent.width/4
                    height: parent.height
                    color: "lightsteelblue"
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

                        }
                    }
                }
            }


        }
    }
}


