import QtQuick
import QtQuick.Controls
import ".."


Page{
    id: root
    
    anchors.fill: parent
    signal send()
    onSend: {
        console.log("send1")
    }
    signal send2()
    onSend2: {
        console.log("send2")
    }

    Column{
        anchors.centerIn: parent
        width: 150
        spacing: 10
        Text{
            text: "register"
            font.pointSize: 20
        }
        Repeater{
            model: ["name","password"]
            delegate: Column{
                Text{
                    text: modelData
                }
                Rectangle{
                    width: 100
                    height: 20
                    TextInput{
                        anchors.fill: parent
                    }
                    border.width: 2
                }
            }
        }
        Row{
            OpButton{
                id: register
                operation: "register"
            }
            OpButton{
                id: cancel
                operation: "cancel"
                theColor: "red"
            }
        }
    }
    Component.onCompleted: {
        register.onClicked.connect(send)
        cancel.onClicked.connect(send2)
    }
}