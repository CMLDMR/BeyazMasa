import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import QtQuick.Dialogs 1.3
import "TalepScript.js" as TalepManager
import serik.bel.tr.TalepManagerPage 1.0
import serik.bel.tr.TalepItem 1.0
import serik.bel.tr.TCManagerPage 1.0
import serik.bel.tr.TCItem 1.0
import serik.bel.tr.TalepEvent 1.0


Item {


    anchors.fill: parent
    id: pdfEkleDialogID
    property string talepOid
    property TalepEvent talepEvent: TalepEvent{}
    property TalepManagerPage talepManager: Backend.createTalepManager();
    signal updated()

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
                    text: qsTr("PDF Ekle")
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

                Image {
                    id: fotografImgID
                    source: ""
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    property string pdfurl


                    Text {
                        text: qsTr("PDF Seç")
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

                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                fileDialog.open();
                            }
                        }
                    }
                }

                FileDialog {
                    id: fileDialog
                    title: "Please choose a file"
                    folder: shortcuts.home
                    nameFilters: ["PDF Dosyası (*.pdf)"]
                    onAccepted: {
                        fotografImgID.pdfurl = fileDialog.fileUrl
                        fotografImgID.source = "qrc:/file/icon/adobe-acrobat-pdf-file-document-512.png";
                    }
                    onRejected: {
                        fotografImgID.source = "";
                        fotografImgID.pdfurl = "";
                    }
                }
            }

            Rectangle{
                width: parent.width
                height: 40
                color: "dimgray"
                Text {
                    text: qsTr("PDF Kaydet")
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

                        if( fotografImgID.pdfurl.length === 0 )
                        {
                            Backend.message = "PDF Seçmediniz";
                            return;
                        }

                        var pdfOid = talepManager.uploadFile(fotografImgID.pdfurl)

                        talepEvent.PdfOid = pdfOid;
                        talepEvent.talepOid = talepOid;
                        talepEvent.personelName = User.adsoyad;
                        talepEvent.personelOid = User.UserOid;
                        talepEvent.Type = TalepEvent.Pdf;

                        if( talepManager.insertTalepEvent(talepEvent) )
                        {
                            Backend.message = "PDF Eklendi";
                            closeUpAciklamaEkleDialog.start();
                            updated();
                        }else{
                            Backend.message = "! PDF Eklenemedi";
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
        to:pdfEkleDialogID.width
        duration: 350
    }

    PropertyAnimation{
        id: closeUpAciklamaEkleDialog
        target: aciklamaEkleRectID
        property: "width"
        to: 0
        from: pdfEkleDialogID.width
        duration: 350
        onStopped: {
            pdfEkleDialogID.destroy();
        }
    }
}
