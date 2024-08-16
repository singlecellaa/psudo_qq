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
    Chat{id: chat}

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
                stackView.push(register)
            } 
            onSend2: {
                stackView.push(login)
            } 
        }
        Connections{
            target: register
            onSend: {
                stackView.push(chat)
            }
            onSend2: {
                stackView.pop()
            }
        }
        
    }
    StackView{
        id: stackView 
        
        anchors.fill: parent
        initialItem: init
    }
}