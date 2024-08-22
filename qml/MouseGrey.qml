import QtQuick
import QtQuick.Controls

MouseArea{
    property color darker_color: Qt.darker("lightGrey",1.2)
    property color default_color: "lightGrey"
    anchors.fill: parent
    hoverEnabled: true
    onEntered: parent.color = darker_color
    onExited: parent.color = default_color
    onClicked: stackLayout.currentIndex =  1
}