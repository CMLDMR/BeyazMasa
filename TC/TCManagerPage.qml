import QtQuick 2.13
import QtQuick.Controls 2.13
import serik.bel.tr.TCManagerPageV2 1.0

Item {


    id: tcManagerRoot
    anchors.fill: parent
    property int itemWidth: Backend.itemWidth(tcManagerRoot.width,4,4,4,12,12)
    property TCManagerPageV2 tcManager: Backend.createTCManagerV2();




    Rectangle{
        anchors.fill: parent
        color: Qt.rgba(0,0,0,0.5);

        MouseArea{
            anchors.fill: parent
        }

        Column{
            anchors.fill: parent
            anchors.bottomMargin: 30

            Rectangle{
                width: parent.width
                height: 30
                color: "white"
                Text {
                    text: qsTr("TC Veritabanı")
                    color: "black"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize : 9
                    anchors.centerIn: parent
                }
            }

            Rectangle {
                id: controllerID
                width: parent.width
                height: flowingContent.height
                color: "transparent"

                ScrollView {
                    anchors.fill : parent
                    clip : true

                    Flow{
                        id: flowingContent
                        width : parent.parent.width


                        Rectangle{
                            width: itemWidth
                            height: 30
                            border.color: "gray"
                            radius: 4
                            border.width: 1
                            TextInput{
                                width: parent.width
                                height: parent.height
                                horizontalAlignment: TextEdit.AlignHCenter
                                verticalAlignment: TextEdit.AlignVCenter
                                wrapMode: TextEdit.WordWrap
                                Text {
                                    text: qsTr("TCNO ile Sorgula")
                                    color: "gray"
                                    font.bold: true
                                    font.family: "Tahoma"
                                    font.pointSize : 9
                                    anchors.centerIn: parent
                                    visible: !parent.text
                                }

                                onTextChanged: {
                                    tcManager.updateWidthTCNO(text);
                                }
                            }
                        }

                        Rectangle{
                            width: itemWidth
                            height: 30
                            border.color: "gray"
                            radius: 4
                            border.width: 1
                            TextInput{
                                width: parent.width
                                height: parent.height
                                horizontalAlignment: TextEdit.AlignHCenter
                                verticalAlignment: TextEdit.AlignVCenter
                                wrapMode: TextEdit.WordWrap
                                Text {
                                    text: qsTr("AdSoyad ile Sorgula")
                                    color: "gray"
                                    font.bold: true
                                    font.family: "Tahoma"
                                    font.pointSize : 9
                                    anchors.centerIn: parent
                                    visible: !parent.text
                                }

                                onTextChanged: {
                                    tcManager.updateWidthAdSoyad(text);
                                }
                            }
                        }


                        Rectangle{
                            width: itemWidth
                            height: 30
                            border.color: "gray"
                            radius: 4
                            border.width: 1
                            TextInput{
                                width: parent.width
                                height: parent.height
                                horizontalAlignment: TextEdit.AlignHCenter
                                verticalAlignment: TextEdit.AlignVCenter
                                wrapMode: TextEdit.WordWrap
                                Text {
                                    text: qsTr("Telefon Numarası ile Sorgula")
                                    color: "gray"
                                    font.bold: true
                                    font.family: "Tahoma"
                                    font.pointSize : 9
                                    anchors.centerIn: parent
                                    visible: !parent.text
                                }
                                onTextChanged: {
                                    tcManager.updateWidthTelefon(text);
                                }
                            }
                        }

                    }
                }
            }


            Rectangle {
                id: contentItemID
                width: parent.width
                height: parent.height-60-controllerID.height
                color: "transparent"

                ScrollView {
                    anchors.fill : parent
                    clip : true

                    Flow{
                        width : parent.parent.width

                        Repeater{
                            model: tcManager.list

                            TCListItem{
                                tcItem: modelData
                                width: Backend.itemWidth(contentItemID.width,4,4,4,6,12)
                                height: 50
                            }


                        }
                    }
                }
            }


        }


        Rectangle{
            width: parent.width
            height: 40
            color: "transparent"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 30

            Row{
                anchors.fill: parent
                Rectangle{
                    width: parent.width/3
                    height: parent.height
                    color: "black"
                    Text {
                        text: qsTr("Geri")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        anchors.centerIn: parent
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: {
                            tcManager.back();
                        }
                    }
                }

                Rectangle{
                    width: parent.width/3
                    height: parent.height
                    color: "black"
                    Text {
                        text: tcManager.currentPage
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    width: parent.width/3
                    height: parent.height
                    color: "black"
                    Text {
                        text: qsTr("İleri")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        anchors.centerIn: parent
                    }

                    MouseArea{
                        anchors.fill: parent
                        cursorShape: "PointingHandCursor"
                        onClicked: {
                            tcManager.next();
                        }
                    }
                }
            }

        }

        Rectangle{
            width: parent.width
            height: 30
            color: "dimgray"
            anchors.bottom: parent.bottom
            Text {
                text: qsTr("Kapat")
                color: "white"
                font.bold: true
                font.family: "Tahoma"
                font.pointSize : 9
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                cursorShape: "PointingHandCursor"
                onClicked: {
                    tcManagerRoot.destroy();
                }
            }

        }





        Component.onCompleted: {

            tcManager.errorOccur.connect(function(error){

                Backend.message = error;

            });

            tcManager.updatelist();


        }

    }






}
