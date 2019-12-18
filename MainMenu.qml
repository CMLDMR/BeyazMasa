import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.13
import "Dilekce/DilekceScripts.js" as Dilekce
import "Talep/TalepScript.js" as TalepManager

import "ScriptFiles/MainMenuScript.js" as MenuManager

Item {

//    width: parent.width
//    height: parent.height

//    anchors.fill: parent
//    anchors.topMargin: 50
//    anchors.leftMargin: 284


    Rectangle{
        id: menuroot
        width: parent.width
        height: parent.height

        color: "darkSlateGray"
        anchors.centerIn: parent
        property int itemWidth: Backend.itemWidth(width,1,2,3,4,6);


        ScrollView{
            anchors.fill: parent
            clip: true
            Flow{
//                spacing: 20
                width: menuroot.width

                // Dilekçe Giriş
                Rectangle{
                    id: dilekceGirisMenu
                    width: menuroot.itemWidth
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
                // Dilekçe Giriş END

                // Talep Giriş Kontrol
                Rectangle{
                    id: sikayetGirisMenu
                    width: menuroot.itemWidth
                    height: 100
                    color: "darkSlateGray"
                    radius: 5
                    border.color: "white"
                    Text {
                        id: sikayetGirisMenuText
                        text: qsTr("Talepler")
                        anchors.centerIn: parent
                        color: "white"
                        font.bold: true
                    }
                    MouseArea{
                        cursorShape: "PointingHandCursor"
                        anchors.fill: parent
                        onEntered: {
                            talepleranimationID.start();
                        }
                        onPressed: {
                            parent.color = "white";
                            sikayetGirisMenuText.color = "black"
                        }
                        onReleased: {
                            parent.color = "darkSlateGray";
                            sikayetGirisMenuText.color = "white"
                            TalepManager.loadTalepManager();
                        }
                    }

                    PropertyAnimation{
                        id: talepleranimationID
                        target: sikayetGirisMenu
                        property: "color"
                        from:"darkslategray"
                        to: "white"
                        duration: 250
                        onStopped: {
                            sikayetGirisMenuText.color = "black"
                        }
                    }
                }
                // TALEP GIRIS END

                // DILEKCE SORGULAMA
                Rectangle{
                    id: dilekceList
                    width: menuroot.itemWidth
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
                        width: parent.width
                        wrapMode: Text.WordWrap
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        padding: 3
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
                // DILEKCE SORGULAMA


                // DILEKCE KATEGORI AYARLARI
                Rectangle{
                    id: dilekceKategoriItem
                    width: menuroot.itemWidth
                    height: 100
                    color: "darkSlateGray"
                    radius: 5
                    border.color: "white"
                    Text {
                        id: dilekceKategoriItemText
                        text: qsTr("Dilekçe Ayarlar")
                        anchors.centerIn: parent
                        color: "white"
                        font.bold: true
                    }
                    MouseArea{
                        cursorShape: "PointingHandCursor"
                        anchors.fill: parent
                        onPressed: {
                            parent.color = "white";
                            dilekceKategoriItemText.color = "black"
                        }
                        onReleased: {
                            parent.color = "darkSlateGray";
                            dilekceKategoriItemText.color = "white"
                            Dilekce.loadDilekceAyarlarPage();
                        }
                    }
                }
                // DILEKCE SORGULAMA

                // BILGI EDINME SORGULAMA
                Rectangle{
                    id: bilgiEdinmeMenuItem
                    width: menuroot.itemWidth
                    height: 100
                    color: "darkSlateGray"
                    radius: 5
                    border.color: "white"
                    Text {
                        id: bilgiEdinmeMenuItemText
                        text: qsTr("BilgiEdinme")
                        anchors.centerIn: parent
                        color: "white"
                        font.bold: true
                    }
                    MouseArea{
                        cursorShape: "PointingHandCursor"
                        anchors.fill: parent
                        onPressed: {
                            parent.color = "white";
                            bilgiEdinmeMenuItemText.color = "black"
                        }
                        onReleased: {
                            parent.color = "darkSlateGray";
                            bilgiEdinmeMenuItemText.color = "white"
                            MenuManager.loadBilgiEdinme();
                        }
                    }
                }
                // DILEKCE SORGULAMA



            }


        }







    }

}
