function func() {

}


function loadyeniTCKaydet(){


    var component = Qt.createComponent("qrc:/TC/TCView.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID);
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }else{

        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }


}

function loadTalepManager(){


    var component = Qt.createComponent("qrc:/Talep/Talep.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(appWindow);
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }else{

        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }


}



function loadYeniTalepPage(){


    var component = Qt.createComponent("qrc:/Talep/YeniTalep.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID);
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
        }else{

        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
    }

}
