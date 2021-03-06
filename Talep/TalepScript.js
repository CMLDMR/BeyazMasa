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
            return null;
        }else{
            return sprite;
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
        return null;
    }
}


function loadTalepView(talepoid){
    var component = Qt.createComponent("qrc:/Talep/TalepView.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
        if (sprite === null) {
            return null;
        }else{
            return sprite;
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
        return null;
    }
}

function loadAciklamaScreen(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepAciklamaEkle.qml");
    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
        if (sprite === null) {
            return null;
        }else{
            return sprite;
        }
    } else if (component.status === Component.Error) {
        console.log("Error loading component:", component.errorString());
        return null;
    }
}


function loadFotografEkleScreen(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepFotografEkle.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
        if (sprite === null) {
            return null;
        }else{
            return sprite;
        }
    } else if (component.status === Component.Error) {
        console.log("Error loading component:", component.errorString());
        return null;
    }
}

function loadPdfEkleScreen(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepPdfEkle.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
        if (sprite === null) {
            return null;
        }else{
            return sprite
        }
    } else if (component.status === Component.Error) {
        console.log("Error loading component:", component.errorString());
        return null;
    }
}

function loadKonumEkleScreen(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepKonumEkle.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
        if (sprite === null) {
            return null;
        }else{
            return sprite;
        }
    } else if (component.status === Component.Error) {
        console.log("Error loading component:", component.errorString());
        return null;
    }
}

function loadSmsGonderScreen(talepoid)
{
    var component = Qt.createComponent("qrc:/Talep/TalepSmsGonder.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID,{talepOid:talepoid});
        if (sprite === null) {
            return null;
        }else{
            return sprite;
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
        return null;
    }
}


function loadKategorilist()
{
    var component = Qt.createComponent("qrc:/Talep/Kategoriler/KategoriList.qml");

    if (component.status === Component.Ready) {
        var sprite = component.createObject(talepitemID);
        if (sprite === null) {
            return null;
        }else{
            return sprite;
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
        return null;
    }
}



function loadComponent(url){
    var component = Qt.createComponent(url);
    if (component.status === Component.Ready) {
        var sprite = component.createObject(appWindow);
        if (sprite === null) {
            // Error Handling
            console.log("Error creating object");
            Backend.message = "Component Oluşturulamadı";
        }else{
            return sprite;
        }
    } else if (component.status === Component.Error) {
        // Error Handling
        console.log("Error loading component:", component.errorString());
        Backend.message = "Component Yüklenemedi. " + component.errorString();
    }
    return null;
}

