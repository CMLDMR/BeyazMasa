import QtQuick 2.13

Item {


    anchors.fill: parent
    id: messageDialogID


    property string message: ""


    Rectangle{
        width: appWindow.width;
        height: appWindow.height;
        color: "#b3000000"

        MouseArea{
            anchors.fill: parent
        }

        Rectangle{
            id: messageDialogRectID
            radius: 15
            width: 550
            height: 0
            color: "#e2e2e2"
            border.color: "black"

            anchors.centerIn: parent

            Text {
                text: message
                font.bold: true
                font.family: "Tahoma"
                font.pointSize: 11
                anchors.centerIn: parent
                width: parent.width
                wrapMode: Text.WordWrap
            }


            Rectangle{
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: parent.right

                color: "#4f4055"
                Text {
                    id: name
                    text: "Tamam"
                    anchors.centerIn: parent
                    color: "white"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize: 12
                }
                height: name.height+10
                MouseArea{
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    onClicked: {
                        messageDialogID.destroy();
                    }
                }
            }

            PropertyAnimation{
                id: messageDialogRectIDAnimation
                target: messageDialogRectID
                property: "height"
                from:0
                to:200
                duration: 250
            }
        }

    }






    function showDialog()
    {
        messageDialogRectIDAnimation.start();

    }

}
