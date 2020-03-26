import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.12
import serik.bel.tr.TalepKateogoriManagerPage 1.0

Item {


    property TalepKateogoriManagerPage talepKategoriManeger: Backend.createTalepKategoriManager();


    anchors.fill: parent


    MouseArea{
        anchors.fill: parent
    }



    Rectangle{
        color: "#cc7a7a7a"
        anchors.fill: parent



        Rectangle{
            anchors.fill: parent
            anchors.bottomMargin: 50
            color: "red"


            ScrollView{
                width: parent.width
                height: parent.height
                clip: true
                contentWidth: width

                Flow{
                    anchors.fill: parent
                    spacing: 5
                    Repeater{
                        id: talepKategoriListRepeaterID
                        model: talepKategoriManeger.list
                        anchors.fill: parent
                        KategoriListItem{
                            width: parent.width
                            height: 50
                        }

                        Component.onCompleted: {
                            console.log("Kategori Count: " + count)
                        }

//                        TalepListItem{
//                            talepItem: modelData
//                            onClickTalep: {
//                                var result = TalepManager.loadTalepView(talepoid);
//                                result.updated.connect(function(){
//                                    talepManeger.find();
//                                });
//                            }
//                        }
                    }
                }
            }


        }












        Rectangle{
            width: parent.width
            height: 50
            anchors.bottom: parent.bottom
            color: "dimgray"
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
                    parent.destroy();
                }
            }
        }
    }







}
