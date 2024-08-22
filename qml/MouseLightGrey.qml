import QtQuick
import QtQuick.Controls

MouseArea{
    property color darker_color: "lightGrey"
    property color default_color: "white"
    anchors.fill: parent
    hoverEnabled: true
    onEntered: parent.color = darker_color
    onExited: parent.color = default_color
}