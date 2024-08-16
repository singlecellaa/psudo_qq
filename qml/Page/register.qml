import QtQuick

Rectangle{
    id: root
    
    anchors.fill: parent
    Column{
        Text{
            text: "register"
            font.pointSize: 20
        }
        Repeater{
            spacing: 10
            model: ["name","password"]
            delegate: Column{
                Text{
                    text: modelData
                }
                Rectangle{
                    width: 100
                    height: 40
                }
            }
        }
        Row{
            opButton{
                operation: "register"
            }
            cancelButton{
            }
        }
    }
    
}