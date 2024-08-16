import QtQuick
import QtQuick.Controls
import "Page"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Item{
        states: [
            State{
                name: "init"
            },
            State{
                name: "register"
            },
            State{
                name: "login"
            },
            State{
                name: "chat"
            }
        ]
    }
    StackView{
        id: stackView 
        
        anchors.fill: parent
        initialItem: Init{}
    }
}