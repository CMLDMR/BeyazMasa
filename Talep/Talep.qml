import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import "TalepScript.js" as TalepManager
import serik.bel.tr.TalepManagerPage 1.0

Item {


    anchors.fill: parent
    id: talepitemID

    property int limit: 25
    property int skip: 0
    property int count: 0

    property int filterType: 0
    property string durumFilter: "Hepsi"
    property string birimFilter: "Hepsi"

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

            anchors.bottomMargin: 135

            spacing: 5

            TalepMenu{
                width: parent.width
                height: 35
                onYeniTalepActivated: {
                    var result = TalepManager.loadYeniTalepPage();
                    result.added.connect(function(){
                        if( durumFilter !== "Hepsi" )
                        {
                            talepManeger.find(durumFilter,limit,skip);
                        }else{
                            talepManeger.find(limit,skip);
                        }
                    });
                }

                onTcnoCompleted: {
                    if( tcno.length === 0 )
                    {
                        count = talepManeger.talepCount();
                        talepManeger.find();
                    }else{
                        count = talepManeger.talepCount(tcno);
                        talepManeger.find(tcno);
                    }
                }

                onFilterChanged: {
                    filterType = 0;
                    durumFilter = filter;
                    if( filter === "Hepsi" )
                    {
                        count = talepManeger.talepCount();
                        talepManeger.find(limit,skip);

                    }else{
                        durumFilter = filter;
                        count = talepManeger.talepCount(filter,0);
                        talepManeger.find(filter,limit,skip);
                    }
                }

                onBirimChanged: {
                    filterType = 1;
                    birimFilter = birimfilter
                    if( birimFilter === "Hepsi" )
                    {
                        count = talepManeger.talepCount();
                        talepManeger.find(limit,skip);
                    }else{
                        count = talepManeger.talepCount(birimFilter,1);
                        talepManeger.findByBirim(birimFilter,limit,skip);
                    }


                }

                onKategorilerActivated: {
                    var result = TalepManager.loadKategorilist();
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
            color: "steelblue"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            opacity: 0.5

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

                            if( filterType == 0 )
                            {

                                if( durumFilter !== "Hepsi" )
                                {
                                    count = talepManeger.talepCount(durumFilter,0);
                                }else{
                                    count = talepManeger.talepCount();
                                }


                                if( skip > 0 )
                                {
                                    skip -= limit;
                                    if( skip < 0 )
                                    {
                                        skip = 0;
                                    }
                                    talepManeger.find(durumFilter,limit,skip);
                                }

                            }else{

                                if( birimFilter !== "Hepsi" )
                                {
                                    count = talepManeger.talepCount(birimFilter,1);
                                }else{
                                    count = talepManeger.talepCount();
                                }

                                if( skip > 0 )
                                {
                                    skip -= limit;
                                    if( skip < 0 )
                                    {
                                        skip = 0;
                                    }
                                    talepManeger.findByBirim(birimFilter,limit,skip);
                                }

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

                            if( filterType == 0 )
                            {
                                if( durumFilter !== "Hepsi" )
                                {
                                    count = talepManeger.talepCount(durumFilter,0);
                                }else{
                                    count = talepManeger.talepCount();
                                }


                                if( count > ( skip + limit ) )
                                {
                                    skip += limit;
                                    if( skip > count )
                                    {
                                        skip = count - limit;
                                    }
                                    talepManeger.find(durumFilter,limit,skip);
                                }
                            }else{

                                if( birimFilter !== "Hepsi" )
                                {
                                    count = talepManeger.talepCount(birimFilter,1);
                                }else{
                                    count = talepManeger.talepCount();
                                }

                                if( count > ( skip + limit ) )
                                {
                                    skip += limit;
                                    if( skip > count )
                                    {
                                        skip = count - limit;
                                    }
                                    talepManeger.findByBirim(birimFilter,limit,skip);
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

        skip = 0;
        talepManeger.find(limit,skip);
        if( limit + skip < count )
        {

        }
    }







}
