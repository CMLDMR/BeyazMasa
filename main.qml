import QtQuick 2.13
import QtQuick.Window 2.13
import "ScriptFiles/LoginScreen.js" as LoginLoader

Window {
    visible: true
    width: 1280
    height: 720
    title: qsTr("Beyaz Masa")


    Rectangle{
        id: appWindow
        color: "#2b534e"
        anchors.fill: parent


        Component.onCompleted: {
            LoginLoader.loadLoginScreen();
        }
    }

}
