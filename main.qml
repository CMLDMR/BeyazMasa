import QtQuick 2.13
import QtQuick.Window 2.12
import "ScriptFiles/LoginScreen.js" as LoginLoader

Window {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Beyaz Masa")


    MouseArea{
        anchors.fill: parent

        onClicked: {
            print("Clicked Main Windows");
        }
    }


    Rectangle{
        id: appWindow
        color: "#2b534e"
        anchors.fill: parent


        Component.onCompleted: {
            LoginLoader.loadLoginScreen();
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
            var component = Qt.createComponent("qrc:/MainMenu.qml");
            if (component.status === Component.Ready) {
                var sprite = component.createObject(appWindow);
                if (sprite === null) {
                    console.log("Error creating object");
                }
            } else if (component.status === Component.Error) {
                console.log("Error loading component:", component.errorString());
            }
            LoginLoader.loadPersonelScreen();
        }
    }

}
