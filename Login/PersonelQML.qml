import QtQuick 2.13
import QtQuick.Controls 2.5

Item {

    width: parent.width
    height: parent.height

    Rectangle {
        id: flowIdRect
        width: parent.width
        height: parent.height
        anchors.centerIn : parent

        color: "dimgray"

        ScrollView {
            anchors.fill : parent
            clip : true

            Flow{
                width : flowIdRect.width;

                Rectangle{
                    id: personelPhotoRect
                    width: Backend.itemWidth(flowIdRect.width,12,12,12,12,12);
                    height: 100
                    color: "transparent"
                    Image {
                        source: User.photoURL
                        anchors.fill: parent
                        fillMode: Image.PreserveAspectFit
                    }
                }

                Rectangle{
                    id: personelBilgiRectID
                    width: Backend.itemWidth(flowIdRect.width,12,12,12,12,12);
                    height: 100
                    color: "transparent"
                    Column{
                        anchors.margins: 10
                        anchors.fill: parent

                        Rectangle{
                            width: parent.width
                            color: "transparent"
                            Text {
                                id: adsoyadID
                                text: qsTr(User.adsoyad)
                                color: "white"
                                font.bold: true
                                anchors.centerIn: parent
                                horizontalAlignment: Text.AlignHCenter
                                width: parent.width
                                wrapMode: Text.WordWrap
                            }
                            height: adsoyadID.height
                        }
                        Rectangle{
                            width: parent.width
                            color: "transparent"
                            Text {
                                id: statuID
                                text: qsTr(User.statu)
                                color: "white"
                                font.bold: true
                                anchors.centerIn: parent
                                horizontalAlignment: Text.AlignHCenter
                                width: parent.width
                                wrapMode: Text.WordWrap
                            }
                            height: birimID.height
                        }
                        Rectangle{
                            width: parent.width
                            color: "transparent"
                            Text {
                                id: birimID
                                text: qsTr(User.birimi)
                                color: "white"
                                font.bold: true
                                anchors.centerIn: parent
                                horizontalAlignment: Text.AlignHCenter
                                width: parent.width
                                wrapMode: Text.WordWrap
                            }
                            height: birimID.height
                        }


//                        Text {
//                            text: qsTr(User.statu)
//                            color: "white"
//                            font.bold: true
//                        }
//                        Text {
//                            text: qsTr(User.birimi)
//                            color: "white"
//                            font.bold: true
//                        }
                    }
                }
            }
        }
    }

}
