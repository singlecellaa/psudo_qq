import QtQuick
import QtQuick.Controls
import "Page"

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    
    Init{id: init}
    Register{id: register}
    Login{id: login}
    //Chat{}

    property string theText : "root text"
    
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
        
        
        Connections {
            target: init
            onSend: {
                console.log("connected 1")
                stackView.push(register)
            } 
            onSend2: {
                console.log("connected 2")
                stackView.push(login)
            } 
        }
        
    }
    StackView{
        id: stackView 
        
        anchors.fill: parent
        initialItem: init
    }
}