import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import "TalepScript.js" as TalepManager
import serik.bel.tr.TalepManagerPage 1.0

Item {


    anchors.fill: parent
    id: talepitemID

    property int limit: 10
    property int skip: 0
    property int count: 0

    property TalepManagerPage talepManeger: Backend.createTalepManager();

    Rectangle{
        width: parent.width
        height: parent.height
        color: "#7df9fd"
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#499fa0";
            }
            GradientStop {
                position: 1.00;
                color: "#292929";
            }
        }





        Column{
            anchors.fill: parent
            anchors.bottomMargin: 55
            spacing: 5


            TalepMenu{
                width: parent.width
                height: 50
                onYeniTalepActivated: {
                    var result = TalepManager.loadYeniTalepPage();
                    result.added.connect(function(){
                        talepManeger.find();
                    });
                }

                onTcnoCompleted: {
                    print("TCNO Tamamlandı: "+tcno);
                    if( tcno.length === 0 )
                    {
                        count = talepManeger.talepCount();
                        talepManeger.find();
                    }else{
                        count = talepManeger.talepCount(tcno);
                        talepManeger.find(tcno);
                    }


                }
            }

            Rectangle{
                width: parent.width
                height: parent.height-10
                color: "transparent"


                ScrollView{
                    width: parent.width
                    height: parent.height
                    clip: true
                    contentWidth: width

                    Flow{
                        anchors.fill: parent
                        spacing: 5

                        Repeater{
                            id: talepListRepeaterID
                            model: talepManeger.list
                            anchors.fill: parent
                            TalepListItem{
                                talepItem: modelData
                                onClickTalep: {
                                    var result = TalepManager.loadTalepView(talepoid);
                                    result.updated.connect(function(){

                                        talepManeger.find();
                                    });
                                }
                            }
                        }
                    }
                }
            }


        }


        Rectangle{
            width: parent.width
            height: 50
            color: "red"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50

            Row{
                anchors.fill: parent
                Rectangle{
                    width: parent.width/3
                    height: parent.height
                    color: "dimgray"
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
                            count = talepManeger.talepCount();
                            if( skip > 0 )
                            {
                                skip -= limit;
                                if( skip < 0 )
                                {
                                    skip = 0;
                                }
                                talepManeger.find(limit,skip);
                            }
                        }
                    }
                }

                Rectangle{
                    width: parent.width/3
                    height: parent.height
                    color: "dimgray"
                    Text {
                        text: skip + " - " + (skip+limit) + " / " + count;
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
                    width: parent.width/3
                    height: parent.height
                    color: "dimgray"
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
                            count = talepManeger.talepCount();
                            if( count > ( skip + limit ) )
                            {
                                skip += limit;
                                if( skip > count )
                                {
                                    skip = count - limit;
                                }
                                talepManeger.find(limit,skip);
                            }
                        }
                    }
                }
            }

        }

        Rectangle{
            width: parent.width
            height: 50
            anchors.bottom: parent.bottom
            Text {
                text: qsTr("Kapat")
                color: "black"
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
                onClicked: {
                    talepitemID.destroy();
                }
            }
        }

    }


    Component.onCompleted: {
        count = talepManeger.talepCount();
        if( limit + skip < count )
        {
            talepManeger.find(limit,skip);
        }
    }







}
