import QtQuick 2.13
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13
import serik.bel.tr.TalepKategoriItem 1.0


Item {


    width: parent.width
    height: 50
    property TalepKategoriItem item
    signal deleteClicked(string oid)

    Rectangle{
        width: parent.width
        height: parent.height

        Row{
            anchors.fill: parent


            Rectangle
            {
                width: parent.width/4*3
                height: parent.height
                color: "#3a5e9c"

                Text {
                    text: item.KategoriAdi
                    color: "white"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize : 9
                    anchors.centerIn: parent
                }
            }

            Rectangle
            {
                width: parent.width/4
                height: parent.height
                color: "#a41305"

                Text {
                    text: "Sil"
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
                        if( item.Oid.length > 0 )
                        {
                            deleteClicked(item.Oid);
                        }
                    }
                }
            }
        }



    }

}
