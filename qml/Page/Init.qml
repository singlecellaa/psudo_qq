import QtQuick
import QtQuick.Controls
import "../"

Page{
    id: root
    title: qsTr("Init")
    
    signal send()
    onSend: console.log("send1")
    
    signal send2()
    onSend2: console.log("send2")

    Column{
            anchors.centerIn: parent
            spacing: 2
            Repeater{
                id: repeater
                model: ["register","login"]
                delegate: Button{
                    id: button2
                    width: 100
                    height: 30
                    background: Rectangle{
                        anchors.fill: parent
                        color: "lightBlue"
                        border.width: 2
                    }
                    Text{
                        anchors.centerIn: parent
                        text: modelData
                    }
                }
            }
    }
    
    Component.onCompleted: {
        repeater.itemAt(0).onClicked.connect(send)
        repeater.itemAt(1).onClicked.connect(send2)
    }
    
}