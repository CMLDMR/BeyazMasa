import QtQuick 2.13
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

import "ScriptFiles/LoginScreen.js" as LoginLoader

import "Login/"


Window {

    visible: true
    width: 1280
    height: 720
    title: qsTr("Beyaz Masa")

    Rectangle{
        width: 100
        height: 20
        color: "dimGray"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        z: 100
        Text {
            text:Backend.screenType
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


    onWidthChanged: {
        Backend.BootWidth = width
    }

    Component.onCompleted: {
        Backend.BootWidth = width
    }


    MouseArea{
        anchors.fill: parent
    }


    Rectangle{
        id: appWindow
        color: "#2b534e"
        anchors.fill: parent
        Component.onCompleted: {
            LoginLoader.loadLoginScreen();
        }

        Rectangle {
            width: parent.width
            height: parent.height
            anchors.centerIn : parent
            color: "transparent"
            ScrollView {
                anchors.fill : parent
                clip : true

                Flow{
                    width : parent.parent.width

                    Rectangle{
                        width: 200
                        height: appWindow.height
                        color: "red"
                        PersonelQML{
                            anchors.fill: parent
                        }
                    }

                    Rectangle{
                        width: parent.width-200
                        height: appWindow.height
                        color: "green"
                        MainMenu{
                            anchors.fill: parent
                        }
                    }
                }
            }
        }


    }


    Connections {
        target: Backend
        onMessageChanged: {

            var component = Qt.createComponent("qrc:/Comman/MessageDialog.qml");

            if (component.status === Component.Ready) {
                var sprite = component.createObject(appWindow);
                if (sprite === null) {
                    // Error Handling
                    console.log("Error creating object");
                }else{
                    sprite.message = _message;
                    sprite.showDialog();
                }
            } else if (component.status === Component.Error) {
                // Error Handling
                console.log("Error loading component:", component.errorString());
            }

        }
    }

    Connections{
        target: User
        onLogined:{
//            var component = Qt.createComponent("qrc:/MainMenu.qml");
//            if (component.status === Component.Ready) {
//                var sprite = component.createObject(appWindow);
//                if (sprite === null) {
//                    console.log("Error creating object");
//                }
//            } else if (component.status === Component.Error) {
//                console.log("Error loading component:", component.errorString());
//            }
//            LoginLoader.loadPersonelScreen();
        }
    }

}
