import QtQuick
import QtQuick.Controls

Button{
    id: root
    property string operation
    property string theColor: "lightGreen"
    property int radius
    width: 50
    height: 30
    background: Rectangle{
        width: root.width
        height: root.height
        radius: root.radius
        color: theColor
    }
    Text{
        text: operation
        color: "white"
        anchors.centerIn: parent
        
    }
}