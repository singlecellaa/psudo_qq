import QtQuick
import QtQuick.Controls

Button{
    id: root
    property string operation
    property string theColor: "lightGreen"
    width: 50
    height: 20
    background: Rectangle{
        width: root.width
        height: root.height
        color: theColor
        border{
            width: 2
            color: "white"
        }
    }
    Text{
        text: operation
    }
}