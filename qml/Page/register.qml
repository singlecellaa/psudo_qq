import QtQuick
import QtQuick.Controls
import "../../"
import ".."


Page{
    id: root
    
    anchors.fill: parent
    Column{
        anchors.centerIn: parent
        spacing: 10
        Text{
            text: "register"
            font.pointSize: 20
        }
        Repeater{
            model: ["name","password"]
            delegate: Column{
                TextInput{
                    text: modelData
                }
                Rectangle{
                    width: 100
                    height: 40
                }
            }
        }
        // Row{
        //     OpButton{
        //         operation: "register"
        //     }
        //     OpButton{
        //         operation: "cancel"
        //     }
        // }
    }
    
}