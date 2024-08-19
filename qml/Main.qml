import QtQuick
import QtQuick.Controls
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

    Init{id: init}
    Register{id: register}
    Login{id: login}
    Chat{id: chat}
    DBManager{}
    property string theText : "root text"
    
    Item{
        id: item
        states: [
            State{
                name: "init"
                PropertyChanges {target: root; maximumHeight: height }
                PropertyChanges {target: root; minimumHeight: height }
                PropertyChanges {target: root; maximumWidth: width   }
                PropertyChanges {target: root; minimumWidth: width   }
                PropertyChanges {target: root; width: 350            }
                PropertyChanges {target: root; height: 350 * 12 / 9}
                
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
            onSend: {
                stackView.push(register)
                item.state = "main"
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
                item.state = "init"
            }
        }
        
    }
    StackView{
        id: stackView 
        
        anchors.fill: parent
        initialItem: init
    }
}