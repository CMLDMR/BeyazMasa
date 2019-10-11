import QtQuick 2.13

Item {

    anchors.fill: parent

    Rectangle{
        anchors.fill: parent
        color: "transparent"



        Rectangle{
            id: loginFieldRect
            color: "#80000000"
            anchors.centerIn: parent
            height: parent.height

            MouseArea{
                anchors.fill: parent
            }

            Rectangle{
                color: "white"
                width: parent.width
                height: 200
                anchors.topMargin: 50
                anchors.top: parent.top

                Text {
                    id: beyazMasaTitleText
                    text: qsTr("Beyaz Masa")
                    color: "black"
                    font.bold: true
                    font.family: "Tahoma"
                    font.pointSize: 15
                    anchors.centerIn: parent
                    opacity: 0
                }

                PropertyAnimation { id: beyazMasaTitleTextAnimation;
                    target: beyazMasaTitleText;
                    property: "opacity";
                    from: 0;
                    to: 1;
                    duration: 3000
                }

            }



            Rectangle {
                id: rectangle
                color: "#ffffff"
                radius: 22
                anchors.centerIn: parent
                width: parent.width > 500 ? 500 : parent.width
                height: 160
                border.color: "#b374bfb7"
                border.width: 1
                clip: true

                Column{
                    anchors.fill: parent
                    spacing: 5

                    // Telefon Numarası
                    Rectangle {
                        radius: 2
                        implicitWidth: parent.width
                        implicitHeight: 55
                        color: "transparent"
                        TextInput{
                            anchors.centerIn: parent
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            width: parent.width
                            height: 50
                            font.bold: false
                            font.family: "Tahoma"
                            font.pointSize: 14
                            font.underline: true

                            Text {
                                text: qsTr("Telefon Numarası Giriniz")
                                color: "gray"
                                visible: !parent.text
                                font: parent.font
                                anchors.centerIn: parent
                            }
                        }
                    }

                    Rectangle{
                        width: parent.width
                        height: 1
                        color: "black"
                    }

                    // Şifre Alanı
                    Rectangle {
                        radius: 2
                        implicitWidth: parent.width
                        implicitHeight: 55
                        color: "transparent"
                        TextInput{
                            anchors.centerIn: parent
                            horizontalAlignment: TextInput.AlignHCenter
                            verticalAlignment: TextInput.AlignVCenter
                            width: parent.width
                            height: 50
                            font.bold: false
                            font.family: "Tahoma"
                            font.pointSize: 14
                            font.underline: true
                            echoMode: TextInput.Password

                            Text {
                                text: qsTr("Şifrenizi Giriniz")
                                color: "gray"
                                visible: !parent.text
                                font: parent.font
                                anchors.centerIn: parent
                            }
                        }
                    }

                    Rectangle {
                        radius: 22
                        implicitWidth: parent.width
                        implicitHeight: 40
                        color: "black"
                        Text {
                            text: qsTr("Giriş")
                            color: "white"
                            anchors.centerIn: parent
                        }
                    }

                }




            }

            PropertyAnimation { id: animation;
                target: loginFieldRect;
                property: "width";
                from: 0;
                to: 1024;
                duration: 250
                onStopped: {
                    beyazMasaTitleTextAnimation.start();
                }
            }

            Component.onCompleted: {
                animation.start();
            }

        }






    }



}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:4;anchors_height:200;anchors_width:640;anchors_x:-300;anchors_y:140}
D{i:2;anchors_height:480;anchors_width:0}
}
##^##*/
