
function loadDilekceKategoriPage()
{
    var component = Qt.createComponent("qrc:/Dilekce/DilekceKategoriPage.qml");
    if (component.status === Component.Ready) {
        var sprite = component.createObject(appWindow);
        if (sprite === null) {
            Backend.message = "Dilekçe Kategorilerine Erişilemiyor";
        }
    } else if (component.status === Component.Error) {
        Backend.message = "Dilekçe Kategorilerine Erişilemiyor: " + component.errorString();
    }
}

function loadDilekceAyarlarPage()
{
    var component = Qt.createComponent("qrc:/Dilekce/DilekceAyarlar.qml");
    if (component.status === Component.Ready) {
        var sprite = component.createObject(appWindow);
        if (sprite === null) {
            Backend.message = "Dilekçe Ayarlarına Erişilemiyor";
        }
    } else if (component.status === Component.Error) {
        Backend.message = "Dilekçe Ayarlarına Erişilemiyor: " + component.errorString();
    }
}





function loadDilekceGirisPage()
{



    var component = Qt.createComponent("qrc:/Dilekce/DilekceGirisPage.qml");

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

function loadYeniDilekcePage(){


    var component = Qt.createComponent("qrc:/Dilekce/YeniDilekcePage.qml");

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


function loadDilekceListPage()
{
    var component = Qt.createComponent("qrc:/Dilekce/DilekceListPage.qml");

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


function loadYeniDilekceFullView(dilekceOid_){


    var component = Qt.createComponent("qrc:/Dilekce/DilekceFullView.qml");

    if (component.status === Component.Ready) {
        var oid = "sdsdsds";

        var sprite = component.createObject(appWindow,{dilekceOid:dilekceOid_});
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
