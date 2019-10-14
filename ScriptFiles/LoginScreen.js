
// Login Screen Componentini Yüklüyor.
function loadLoginScreen() {

    var component = Qt.createComponent("qrc:/Login/Login.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(appWindow);
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }else{
//            console.log("Creating Object");
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }

}

// Kullanıcı Bilgilerini Ekrana Yansıtıyor
function loadPersonelScreen(){


    var component = Qt.createComponent("qrc:/Login/PersonelQML.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(appWindow);
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }else{
//            console.log("Creating Object");
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }



}
