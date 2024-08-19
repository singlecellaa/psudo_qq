import QtQuick
import QtQuick.Controls

Button{
    id: root
    property string operation
    property string theColor: "lightGreen"
    width: 50
    height: 30
    background: Rectangle{
        width: root.width
        height: root.height
        color: theColor
    }
    Text{
        text: operation
        color: "white"
        anchors.centerIn: parent
        
    }
}