function loadTCView(){
    var component = Qt.createComponent("qrc:/TC/TCView.qml");
    if (component.status === Component.Ready) {
        var sprite = component.createObject(appWindow);
        if (sprite === null) {
            // Error Handling
            Backend.message = ("Error creating object");
        }else{

        }
    } else if (component.status === Component.Error) {
        // Error Handling
        Backend.message = ("Error loading component: "+ component.errorString());
    }
}


function loadTCQML( tcitem )
{
    var component = Qt.createComponent("qrc:/TC/TCQml.qml");
    if (component.status === Component.Ready) {
        var sprite = component.createObject(appWindow,{tcoid:tcitem});
        if (sprite === null) {
            Backend.message = ("Error creating object");
            return null;
        }else{
            return sprite;
        }
    } else if (component.status === Component.Error) {
        Backend.message = ("Error loading component: "+ component.errorString());
        return null;
    }
}

