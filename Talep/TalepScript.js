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


function loadTalepView(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepView.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
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

function loadAciklamaScreen(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepAciklamaEkle.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
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


function loadFotografEkleScreen(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepFotografEkle.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
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

function loadPdfEkleScreen(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepPdfEkle.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
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

function loadKonumEkleScreen(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepKonumEkle.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
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

function loadSmsGonderScreen(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepSmsGonder.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
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

