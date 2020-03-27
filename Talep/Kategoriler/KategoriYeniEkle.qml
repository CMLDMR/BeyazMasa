import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.12
import serik.bel.tr.TalepKateogoriManagerPage 1.0
import "../TalepScript.js" as TalepScript

Item {

    id: yeniEkleItemID
    anchors.fill: parent

    signal yeniKategoriAdi(string kategoriAdi);


    MouseArea{
        anchors.fill: parent
    }



    Rectangle{
        color: "#b3235e91"
        anchors.fill: parent
        Rectangle{
            id: mainKategoriInputRect
            width: parent.width/2
            height: 0
            color: "steelblue"
            anchors.centerIn: parent
            clip: true

            Column{
                anchors.fill: parent

                Rectangle{
                    width: parent.width
                    height: 30
                    Text {
                        text: qsTr("Yeni Kategori Ekle")
                        color: "black"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        anchors.centerIn: parent
                    }
                }

                Rectangle{
                    width: parent.width
                    height: 50
                    color: "#d3d3d3"
                    TextInput{
                        id: yeniKategoriAdiTextInput
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment: TextInput.AlignVCenter
                        wrapMode: TextInput.WordWrap
                        width: parent.width
                        height: parent.height
                        Text{
                            text: "Kategori Adını Giriniz"
                            anchors.centerIn: parent
                            visible: !parent.text
                            color: "gray"
                            font.pointSize : 9
                        }
                    }
                }

                Rectangle{
                    width: parent.width
                    height: 30
                    color: "#4d4d4d"
                    Text {
                        text: qsTr("Ekle")
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
                            if( yeniKategoriAdiTextInput.text.length < 5 )
                            {
                                Backend.message = "Kategori Adı en Az 5 Karakterden Oluşmalı!";
                            }else{
                                yeniKategoriAdi(yeniKategoriAdiTextInput.text)
                            }

                        }
                    }
                }

                Rectangle{
                    width: parent.width
                    height: 50
                    color: "#511f1f"
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
                        onClicked: {
                            closeRect.start()
                        }
                    }
                }
            }

        }

        PropertyAnimation{
            id: openRect
            target: mainKategoriInputRect
            property: "height"
            from:0
            to: 160
            duration: 250
        }


        PropertyAnimation{
            id: closeRect
            target: mainKategoriInputRect
            property: "height"
            from:160
            to: 0
            duration: 250
            onStopped: {
                yeniEkleItemID.destroy()
            }
        }

        Component.onCompleted: {
            openRect.start()


        }

    }

}
