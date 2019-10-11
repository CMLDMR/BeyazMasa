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

}
