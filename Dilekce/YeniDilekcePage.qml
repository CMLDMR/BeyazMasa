import QtQuick 2.13
import QtQuick.Controls 1.4
import QtGraphicalEffects 1.13
import QtQuick.Dialogs 1.3


Item {

    anchors.fill: parent
    anchors.topMargin: 50
    anchors.leftMargin: 284
    property int componentHeight: 30

    Rectangle{
        color: "darkSlateGray"
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        radius: 5
        border.color: "white"

        Column{
            anchors.fill: parent
            spacing: 5

            Rectangle{
                width: parent.width
                height: 40
                color: "transparent"

                Text {
                    text: qsTr("Yeni Dilekçe Gir")
                    anchors.centerIn: parent
                    font.family: "Tahoma"
                    font.pointSize: 14
                    color: "white"
                }
            }

            Row{
                width: parent.width
                spacing: 5
                Rectangle{
                    width: parent.width/2
                    height: componentHeight
                    color: "white"
                    radius: 5
                    Row{
                        anchors.fill: parent
                        TextInput{
                            width: parent.width
                            height: parent.height
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            Text {
                                text: qsTr("Dilekçe Konusu Giriniz")
                                color: "gray"
                                font.bold: false
                                font.pointSize: 11
                                font.family: "Tahoma"
                                visible: !parent.text
                                anchors.centerIn: parent
                            }
                        }

                    }
                }

                Rectangle{
                    width: parent.width/2
                    height: componentHeight
                    color: "white"
                    radius: 5
                    Row{
                        anchors.fill: parent
                        TextInput{
                            width: parent.width
                            height: parent.height
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            Text {
                                text: qsTr("Dilekçe Sayısını Giriniz")
                                color: "gray"
                                font.bold: false
                                font.pointSize: 11
                                font.family: "Tahoma"
                                visible: !parent.text
                                anchors.centerIn: parent
                            }
                        }

                    }
                }

            }

            Row{
                width: parent.width
                spacing: 5
                Rectangle{
                    width: parent.width/2
                    height: componentHeight
                    color: "white"
                    radius: 5
                    Row{
                        anchors.fill: parent
                        TextInput{
                            width: parent.width
                            height: parent.height
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            Text {
                                text: qsTr("TC NO Giriniz")
                                color: "gray"
                                font.bold: false
                                font.pointSize: 11
                                font.family: "Tahoma"
                                visible: !parent.text
                                anchors.centerIn: parent
                            }
                        }

                    }
                }

                Rectangle{
                    width: parent.width/2
                    height: componentHeight
                    color: "white"
                    radius: 5
                    Row{
                        anchors.fill: parent
                        TextInput{
                            width: parent.width
                            height: parent.height
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            Text {
                                text: qsTr("Ad Soyad Giriniz")
                                color: "gray"
                                font.bold: false
                                font.pointSize: 11
                                font.family: "Tahoma"
                                visible: !parent.text
                                anchors.centerIn: parent
                            }
                        }

                    }
                }

            }

            Row{
                width: parent.width
                spacing: 5
                Rectangle{
                    width: parent.width/2
                    height: componentHeight
                    color: "white"
                    radius: 5
                    Row{
                        anchors.fill: parent
                        TextInput{
                            width: parent.width
                            height: parent.height
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            Text {
                                text: qsTr("Telefon Numarası Giriniz")
                                color: "gray"
                                font.bold: false
                                font.pointSize: 11
                                font.family: "Tahoma"
                                visible: !parent.text
                                anchors.centerIn: parent
                            }
                        }

                    }
                }

                Rectangle{
                    width: parent.width/2
                    height: componentHeight
                    color: "white"
                    radius: 5
                    Row{
                        anchors.fill: parent
                        TextInput{
                            width: parent.width
                            height: parent.height
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            Text {
                                text: qsTr("Adres Giriniz")
                                color: "gray"
                                font.bold: false
                                font.pointSize: 11
                                font.family: "Tahoma"
                                visible: !parent.text
                                anchors.centerIn: parent
                            }
                        }

                    }
                }

            }

            Row{
                width: parent.width
                spacing: 5
                Rectangle{
                    width: parent.width/2
                    height: componentHeight
                    color: "white"
                    radius: 5
                    Row{
                        anchors.fill: parent
                        ComboBox{
                            width: parent.width
                            height: parent.height
                            model: ["test1","test3","test5"]
                            Text {
                                text: qsTr("Gidecek Birimi Seçiniz")
                                color: "gray"
                                font.bold: false
                                font.pointSize: 11
                                font.family: "Tahoma"
                                visible: !parent.text
                                anchors.centerIn: parent
                            }

                        }

                    }
                }

                Rectangle{
                    width: parent.width/2
                    height: componentHeight
                    color: "white"
                    radius: 5
                    Row{
                        anchors.fill: parent
                        ComboBox{
                            width: parent.width
                            height: parent.height
                            model: ["Numarataj","Büz Koyma","Dal Budama"]

                            Text {
                                text: qsTr("İçerik Tipi")
                                color: "gray"
                                font.bold: false
                                font.pointSize: 11
                                font.family: "Tahoma"
                                visible: !parent.text
                                anchors.centerIn: parent
                            }
                        }

                    }
                }

            }

            Row{
                width: parent.width
                spacing: 5
                Rectangle{
                    width: parent.width
                    height: 400
                    color: "white"
                    radius: 5
                    TextInput{
                        width: parent.width
                        height: parent.height
                        horizontalAlignment: TextInput.AlignLeft
                        verticalAlignment: TextInput.AlignTop
                        wrapMode: Text.Wrap
                        font.pointSize: 11
                        padding: 10
                        Text {
                            text: qsTr("Dilekçe İçeriğini Buraya Kopyalayınız ( ctrl + v )")
                            color: "gray"
                            font.bold: false
                            font.pointSize: 11
                            font.family: "Tahoma"
                            visible: !parent.text
                            anchors.centerIn: parent
                        }
                    }
                }
            }

            Row{
                width: parent.width
                spacing: 5
                Row{
                    width: parent.width/2
                    spacing: 5
                    Rectangle{
                        width: parent.width
                        height: componentHeight
                        color: "white"
                        radius: 5

                        Text {
                            text: qsTr("Taranmış Dilekçeyi Seçiniz");
                            color: "gray"
                            anchors.centerIn: parent
                            font.pointSize: 11
                        }

                        FileDialog {
                            id: fileDialog
                            title: "Please choose a file"
                            folder: shortcuts.home
                            onAccepted: {
                                console.log("You chose: " + fileDialog.fileUrls)
                            }
                            onRejected: {
                                console.log("Canceled")
                            }
                        }

                        MouseArea{
                            anchors.fill: parent
                            cursorShape: "PointingHandCursor"
                            onClicked: {
                                fileDialog.open()
                            }
                        }
                    }
                }

                Row{
                    width: parent.width/2
                    spacing: 5
                    Rectangle{
                        width: parent.width
                        height: componentHeight
                        color: "white"
                        radius: 5


                        Text {
                            text: qsTr("Ek Varsa Seçiniz");
                            color: "gray"
                            anchors.centerIn: parent
                            font.pointSize: 11
                        }

                        FileDialog {
                            id: fileDialogEkler
                            title: "Please choose a file"
                            folder: shortcuts.home
                            onAccepted: {
                                console.log("You chose: " + fileDialogEkler.fileUrls)
                            }
                            onRejected: {
                                console.log("Canceled")
                            }
                        }

                        MouseArea{
                            anchors.fill: parent
                            cursorShape: "PointingHandCursor"
                            onClicked: {
                                fileDialogEkler.open()
                            }
                        }


                    }



                }
            }








        }




    }

}
