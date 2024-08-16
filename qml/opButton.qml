import QtQuick
import QtQuick.Controls

Button{
    property string operation

    background: Rectangle{
        color: "lightGreen"
        border{
            width: 2
            color: "white"
        }
    }
    Text{
        text: operation
    }
}