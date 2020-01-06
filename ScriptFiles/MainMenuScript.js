function loadBilgiEdinme() {
    var component = Qt.createComponent("qrc:/BilgiEdinme/BilgiEdinmeMainPage.qml");
    if (component.status === Component.Ready) {
        var sprite = component.createObject(appWindow);
        if (sprite === null) {
            Backend.message = "Bilgi Edinme Nesnesi Oluşturulamadı";
        }
    } else if (component.status === Component.Error) {
        Backend.message = "Bilgi Edinme Sayfası Hata: " + component.errorString();
    }
}


function loadTCVeriTabani() {
    var component = Qt.createComponent("qrc:/TC/TCManagerPage.qml");
    if (component.status === Component.Ready) {
        var sprite = component.createObject(appWindow);
        if (sprite === null) {
            Backend.message = "TC Veritabanı Sayfası Oluşturulamadı";
        }
    } else if (component.status === Component.Error) {
        Backend.message = "TC Veritabanı Sayfası Hata: " + component.errorString();
    }
}
