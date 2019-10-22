import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.13
import "Dilekce/DilekceScripts.js" as Dilekce

Item {


    anchors.fill: parent
    anchors.topMargin: 50
    anchors.leftMargin: 284


    Rectangle{
        id: menuroot
        width: parent.width
        height: parent.height

        color: "darkSlateGray"

        anchors.centerIn: parent



        ScrollView{
            anchors.fill: parent
            clip: true
            Flow{
                spacing: 20
                width: menuroot.width

                Rectangle{
                    id: dilekceGirisMenu
                    width: 200
                    height: 100
                    color: "darkSlateGray"
                    radius: 5
                    border.color: "white"
                    Text {
                        id: dilekceGirisMenuText
                        text: qsTr("Dilekçe Giriş")
                        anchors.centerIn: parent
                        color: "white"
                        font.bold: true
                    }

                    MouseArea{
                        cursorShape: "PointingHandCursor"
                        anchors.fill: parent

                        onPressed: {
                            parent.color = "white";
                            dilekceGirisMenuText.color = "black"
                        }

                        onReleased: {
                            parent.color = "darkSlateGray";
                            dilekceGirisMenuText.color = "white"
                            Dilekce.loadYeniDilekcePage();
                        }
                    }


                }

                Rectangle{
                    id: sikayetGirisMenu
                    width: 200
                    height: 100
                    color: "darkSlateGray"
                    radius: 5
                    border.color: "white"
                    Text {
                        id: sikayetGirisMenuText
                        text: qsTr("Şikayet/Talep Giriş")
                        anchors.centerIn: parent
                        color: "white"
                        font.bold: true
                    }
                    MouseArea{
                        cursorShape: "PointingHandCursor"
                        anchors.fill: parent
                        onPressed: {
                            parent.color = "white";
                            sikayetGirisMenuText.color = "black"
                        }
                        onReleased: {
                            parent.color = "darkSlateGray";
                            sikayetGirisMenuText.color = "white"
                        }
                    }
                }

                Rectangle{
                    id: dilekceList
                    width: 200
                    height: 100
                    color: "darkSlateGray"
                    radius: 5
                    border.color: "white"
                    Text {
                        id: dilekceListMenuText
                        text: qsTr("Dilekçe Sorgulama")
                        anchors.centerIn: parent
                        color: "white"
                        font.bold: true
                    }
                    MouseArea{
                        cursorShape: "PointingHandCursor"
                        anchors.fill: parent
                        onPressed: {
                            parent.color = "white";
                            dilekceListMenuText.color = "black"
                        }
                        onReleased: {
                            parent.color = "darkSlateGray";
                            dilekceListMenuText.color = "white"
                            Dilekce.loadDilekceListPage();
                        }
                    }
                }



            }


        }







    }

}
