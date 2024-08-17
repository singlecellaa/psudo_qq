import QtQuick
import QtQuick.Controls

Rectangle{
    id: root
    property string theText
    property int sender 
    width: theText.width
    height: 30
    anchors.right: parent.right
    Text{
        text: theText
    }
}