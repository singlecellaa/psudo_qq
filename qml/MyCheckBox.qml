import QtQuick
import QtQuick.Controls.Universal

CheckBox{
    property string theText
    property string textColor: "lightGrey"

    indicator: Rectangle{
        id: theBox
        width: 10; height: width
        y: 3
        radius: 2
        anchors.left: parent.left
        color: "transparent"
        border.width: 2
    }
    Text{
        anchors.left: theBox.right
        anchors.leftMargin: 5
        anchors.verticalCenter: theBox.verticalCenter
        
        text: theText
        color: textColor
        font.pointSize: 10
    }
}