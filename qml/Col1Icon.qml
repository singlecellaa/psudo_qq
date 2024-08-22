import QtQuick
import QtQuick.Controls

Rectangle{
    id: root
    property string imagePath: "../resources/"
    property string icon_
    property string h_icon_
    width: 40; height: width
    color: "transparent"
    x: col1_top_icon.x + 7
    radius: 4
    Image{
        id: icon1
        anchors.centerIn: parent
        width: 35
        height: 35
        fillMode: Image.PreserveAspectCrop
        source: icon_listView.currentIndex == index ? imagePath + h_icon_ : imagePath + icon_
    }
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: color = Qt.darker("lightGrey",1.2)
        onExited: color = ListView.iscurrentItem ? root.color :"transparent"
        onClicked: {
            stackLayout2.currentIndex = index
            icon_listView.currentIndex = index
        }
    }
}