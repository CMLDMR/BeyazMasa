import QtQuick 2.13

Item {

    id: personelQMLID


    width: parent.width
    height: 100
    anchors.left: parent.left

    Rectangle{
        anchors.fill: parent
        color: "transparent"



        Rectangle{
            id: personelPhotoRect
            width: 84
            height: 100
            color: "green"
            radius: 5
            border.color: "white"
            anchors.left: parent.left

            Image {
                source: User.photoURL()
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle{
            id: personelBilgiRectID
            width: 200
            height: 100
            color: "transparent"
            anchors.left: personelPhotoRect.right
            Column{
                anchors.margins: 10
                anchors.fill: parent

                Text {
                    text: qsTr(User.adsoyad)
                    color: "white"
                    font.bold: true
                }
                Text {
                    text: qsTr(User.statu)
                    color: "white"
                    font.bold: true
                }
                Text {
                    text: qsTr(User.birimi)
                    color: "white"
                    font.bold: true
                }
            }
        }

        Rectangle{
            color: "white"
            anchors.left: personelBilgiRectID.right
            anchors.right: parent.right
            height: 30
            radius: 5
            border.color: "black"
            Text {
                text: qsTr("e-SERIK")
                anchors.centerIn: parent
                font.bold: true
                font.family: "Tahoma"
                font.pointSize: 12
            }
        }
    }

}