import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import QtQuick.Dialogs 1.3
import "TalepScript.js" as TalepManager
import serik.bel.tr.TalepManagerPage 1.0
import serik.bel.tr.TalepItem 1.0
import serik.bel.tr.TalepEvent 1.0

import QtLocation 5.13
import QtPositioning 5.13

Item {
    anchors.fill: parent
    id: fotografEkleDialogID
    property string talepOid
    property TalepEvent talepEvent: TalepEvent{}
    property TalepManagerPage talepManager: Backend.createTalepManager();

    Rectangle
    {
        id: aciklamaEkleRectID
        width: 0
        height: parent.height
        color: "green"
        anchors.centerIn: parent
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#cc004480"
            }
            GradientStop {
                position: 1.00;
                color: "#f0ffffff";
            }
        }

        Column{
            anchors.fill: parent
            spacing: 3

            Rectangle{
                width: parent.width
                height: 40
                color: "#80ffffff"
                layer.enabled: true
                layer.effect: DropShadow{
                    samples: 6
                    radius: 3
                    color: "black"
                }

                Text {
                    text: qsTr("Fotoğraf Ekle")
                    color: "white"
                    font.bold: false
                    font.family: "Tahoma"
                    font.pointSize : 12
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
                width: parent.width
                height: parent.height-130
                color: "transparent"

                Plugin{
                    id: mapID
                    name: "googlemaps"
                }

                Map{
                    anchors.fill: parent
                    plugin: mapID
                    center: QtPositioning.coordinate(59.91, 10.75) // Oslo
                    zoomLevel: 14
                }


            }

            Rectangle{
                width: parent.width
                height: 40
                color: "dimgray"
                Text {
                    text: qsTr("Foto Ekle")
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

                        if( fotografImgID.source.length === 0 )
                        {
                            Backend.message = "Konum Seçmediniz";
                            return;
                        }

                        var fotoOid = talepManager.uploadPhoto(fotografImgID.source)

                        talepEvent.FotoOid = fotoOid;
                        talepEvent.talepOid = talepOid;
                        talepEvent.personelName = User.adsoyad;
                        talepEvent.personelOid = User.UserOid;
                        talepEvent.Type = TalepEvent.Fotograf;

                        if( talepManager.insertTalepEvent(talepEvent) )
                        {
                            Backend.message = "Fotoğraf Eklendi";
                            closeUpAciklamaEkleDialog.start();
                        }else{
                            Backend.message = "! Fotoğraf Eklenemedi";
                        }


                    }
                }

            }

            Rectangle{
                width: parent.width
                height: 40
                color: "coral"
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
                        closeUpAciklamaEkleDialog.start();
                    }
                }
            }


        }
    }


    Component.onCompleted: {
        openUpAciklamaEkleDialog.start();
    }

    PropertyAnimation{
        id: openUpAciklamaEkleDialog
        target: aciklamaEkleRectID
        property: "width"
        from: 0
        to: fotografEkleDialogID.width
        duration: 350
    }

    PropertyAnimation{
        id: closeUpAciklamaEkleDialog
        target: aciklamaEkleRectID
        property: "width"
        to: 0
        from: fotografEkleDialogID.width
        duration: 350
        onStopped: {
            fotografEkleDialogID.destroy();
        }
    }
}
