



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







function func() {

}
