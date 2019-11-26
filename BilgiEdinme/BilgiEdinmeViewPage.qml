import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13

import serik.bel.tr.BilgiEdinmeManagerPage 1.0
import serik.bel.tr.BilgiEdinmeValue 1.0

import "../TC"

Item {

    anchors.fill: parent
    property BilgiEdinmeValue value
    property BilgiEdinmeManagerPage bilgiEdinmeManager: Backend.createBilgiEdinmeManager();

    signal updated()


    Rectangle{
        anchors.fill: parent
        color: "transparent"


        Column{
            anchors.fill: parent
            Rectangle {
                id: itemID
                width: parent.width
                height: parent.height-100

                ScrollView {
                    anchors.fill : parent
                    clip : true
                    Flow{
                        width : parent.parent.width

                        Rectangle{
                            width: Backend.itemWidth(parent.width,12,12,12,12,12)
                            height: 42
                            color: "#146e71"
                            TCComponent{
                                anchors.fill: parent
                                tcoid : value.tcoid
                                Component.onCompleted: {
                                    initTCComponent();
                                }
                            }
                        }

                        Rectangle{
                            width: Backend.itemWidth(parent.width,1,2,4,4,6)
                            height: 40
                            color: "dimgray"
                            Text {
                                text: "Saat: "+value.saat
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
                            width: Backend.itemWidth(parent.width,2,2,4,4,6)
                            height: 40
                            color: "dimgray"
                            Text {
                                text: "Tarih: " + value.tarih
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
                            width: Backend.itemWidth(parent.width,3,2,4,4,12)
                            height: 40
                            color: "dimgray"
                            ComboBox {
                                property bool startup: true
                                width: parent.width
                                model: Backend.birimler
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
                                Component.onCompleted: {
                                    for( var index in  model )
                                    {
                                        if( model[index] === value.birim )
                                        {
                                            currentIndex = index
                                        }
                                    }
                                    startup = false;
                                }

                                onCurrentTextChanged: {
                                    if( !startup )
                                    {
                                        value.birim = currentText;
                                        if( bilgiEdinmeManager.updateItem(value) ){
                                            Backend.message = "Güncellendi";
                                            updated();
                                        }else{
                                            Backend.message = "Hata: Güncellenemedi";
                                        }
                                    }


                                }
                            }
                        }

                        Rectangle{
                            width: Backend.itemWidth(parent.width,6,6,12,12,12)
                            color: "dimgray"
                            Text {
                                padding: 10
                                id: konutextID
                                text: "Konu: "+value.konu
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
                                width: parent.width
                                wrapMode: Text.WordWrap
                            }
                            height: konutextID.height < 40 ? 40 : konutextID.height
                        }

                        Rectangle{
                            width: Backend.itemWidth(parent.width,12,12,12,12,12)
                            color: "gray"
                            anchors.margins: 10
                            Text {
                                padding: 10
                                id: mesajtextID
                                text: value.mesaj
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
                                width: parent.width
                                wrapMode: Text.WordWrap
                                horizontalAlignment: Text.AlignJustify
                                textFormat: Text.RichText
                            }
                            height: mesajtextID.height
                        }




                    }
                }
            }

            Rectangle{
                width: parent.width
                height: 50
                color: "slateblue"
                Text {
                    text: value.cevaplandi ? "Cevaplandı" : "Cevap Yüklenmemiş"
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
                    cursorShape: "PointingHandCursor"
                    anchors.fill: parent
                    onClicked: {
                        parent.parent.destroy();
                    }
                }
            }



            Rectangle{
                width: parent.width
                height: 50
                color: "slategray"
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
                    cursorShape: "PointingHandCursor"
                    anchors.fill: parent
                    onClicked: {
                        parent.parent.destroy();
                    }
                }
            }

        }





    }



}
