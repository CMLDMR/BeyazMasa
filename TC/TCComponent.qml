import QtQuick 2.13
import serik.bel.tr.TCManagerPage 1.0
import serik.bel.tr.TCItem 1.0
import "../TC/TCScript.js" as TCView
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.13


Item {

    id: tccomponentID
    property string tcoid: ""
    property TCManagerPage tcManager: Backend.createTCManager();

    property string mTelefonNo


    // TC Bilgileri
    Rectangle{
        width: parent.width
        height: 100

        color: "transparent"

        // TC Bilgileri
        Rectangle{
            color: "steelblue"
            width: parent.width
            height: 42
            clip: true
            Flow{
                anchors.fill: parent

                //TCNO
                Rectangle{
                    width: parent.width/2
                    height: 20
                    color: "transparent"
                    Text {
                        id: tcnoTextID
                        anchors.centerIn: parent
                        text: qsTr("TCNO")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }
                //ADSOYAD ALANI
                Rectangle{
                    width: parent.width/2
                    height: 20
                    color: "transparent"
                    Text {
                        id: adsoyadTextID
                        anchors.centerIn: parent
                        text: qsTr("AdSoyad")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }
                //TELEFON
                Rectangle{
                    width: parent.width/2
                    height: 20
                    color: "transparent"
                    Text {
                        id: telefonTextID
                        anchors.centerIn: parent
                        text: "Cep Telefonu: " + mTelefonNo
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }
                //Mahalle
                Rectangle{
                    width: parent.width/2
                    height: 20
                    color: "transparent"
                    Text {
                        id: mahalleTextID
                        anchors.centerIn: parent
                        text: qsTr("Mahalle")
                        color: "white"
                        font.bold: true
                        font.family: "Tahoma"
                        font.pointSize : 9
                        layer.enabled: true
                        layer.effect: DropShadow{
                            color: "black"
                            radius: 3
                            samples: 5
                        }
                    }
                }
                //Mahalle
                Rectangle{
                    width: parent.width
                    height: 2
                    color: "black"
                }
            }
        }
    }





    function initTCComponent(){
        if( tcoid.length === 0 )
        {
            Backend.message = "TCOID Hatalı";
            tccomponentID.destroy();
        }else{

            var tcitem = tcManager.loadByOid(tcoid);
            if( tcitem )
            {
                tcnoTextID.text = "TCNO: " + tcitem.TCNO;
                mahalleTextID.text = "Mahalle: " + tcitem.Mahalle;
                mTelefonNo = tcitem.CepTelefonu;
                adsoyadTextID.text = "Ad Soyad: "+tcitem.AdSoyad;
            }else{
                Backend.message = "TC Bilgileri Yüklenemedi";
            }

        }
    }




    Component.onCompleted: {




    }


}
