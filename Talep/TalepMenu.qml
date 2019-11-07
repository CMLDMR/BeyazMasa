import QtQuick 2.13
import QtGraphicalEffects 1.0

Item {


    signal yeniTalepActivated();
    signal tcnoCompleted(string tcno);

    Rectangle{
        width: parent.width
        height: parent.height
        color: "cornflowerblue"

        Row{
            anchors.fill: parent
            Rectangle{
                width: parent.width/2
                height: parent.height
                Text {
                    text: qsTr("Yeni Talep")
                    color: "darkslategray"
                    font.bold: false
                    font.family: "Tahoma"
                    font.pointSize : 11
                    anchors.centerIn: parent
                }

                MouseArea{
                    anchors.fill: parent
                    cursorShape: "PointingHandCursor"
                    onClicked: {
                        yeniTalepActivated();
                    }
                }
            }
            Rectangle{
                width: parent.width/2
                height: parent.height

                TextInput{
                    width: parent.width
                    height: parent.height
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize: 11
                    Text {
                        text: qsTr("TCNO Listele")
                        color: "darkslategray"
                        font.bold: false
                        font.family: "Tahoma"
                        font.pointSize : 11
                        anchors.centerIn: parent
                        visible: !parent.text
                    }

                    onTextChanged: {
                        if( text.length === 11 )
                        {
                            tcnoCompleted(text);
                        }
                    }
                }


            }
        }

        layer.enabled: true
        layer.effect: DropShadow{
            radius: 3
            samples: 5
            color: "black"
        }

    }
}
