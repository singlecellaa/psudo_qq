import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic
import "Page"

Window {
    id: root
    
    visible: true
    title: qsTr("My QQ")
    
    width: 350            
    height: width * 12 / 9
    maximumHeight: height 
    minimumHeight: height 
    maximumWidth: width   
    minimumWidth: width
    Item{
        Init{id: init}
        Register{id: register}
        Login{id: login}
        Chat{id: chat}
        DBManager{}
    }
    
    Item{
        id: item
        states: [
            State{
                name: "init"
                
                PropertyChanges {target: root; maximumWidth: 350   }
                PropertyChanges {target: root; minimumWidth: 350   }
                PropertyChanges {target: root; maximumHeight:  350 * 12 / 9}
                PropertyChanges {target: root; minimumHeight:  350 * 12 / 9}
            },
            State{
                name: "main"
                PropertyChanges {target: root; maximumHeight: 2000 }
                PropertyChanges {target: root; minimumHeight: 500 }
                PropertyChanges {target: root; maximumWidth: 2000   }
                PropertyChanges {target: root; minimumWidth: 350   }
                PropertyChanges { target: root; height: 640 }
                PropertyChanges { target: root; width: 640 * 16 / 9}
            }
        ]
        
        
        Connections {
            target: init
            function onSend() {
                stackView.pop()
                stackView.push(register)
                item.state = "main"
            } 
            function onSend2() {
                stackView.pop()
                stackView.push(login)
            } 
        }
        Connections{
            target: register
            function onSend() {
                stackView.pop()
                stackView.push(chat)
            }
            function onSend2() {
                stackView.pop()
                item.state = "init"
            }
        }
        Connections{
            target: login
            function onSend() {
                stackView.pop()
                stackView.push(chat)
                item.state = "main"
            }
            function onSend2() {
                stackView.pop()
            }
            function onSend4() {
                stackView.pop()
                stackView.push(register)
                item.state = "main"
            }
        }
    }
    StackView{
        id: stackView 
        
        anchors.fill: parent
        initialItem: init
    }
}