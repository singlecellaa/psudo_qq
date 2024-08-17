import QtQuick
import QtQuick.Controls
Row{
    property int sender: model.sender
    property string theText: model.theText
    property var scrollViewWidth

    Rectangle{
        width: text.width
        height: 20
        x: sender === 0 ? scrollViewWidth - image.width - width: image.width
        anchors.bottom: image.bottom
        
        
        Text{
            id: text
            anchors.centerIn: parent
            text: theText
            font.pointSize: 10
        }
    }
    Image{
        id: image
        width: 40
        height: 40
        x: sender === 0 ? scrollViewWidth - width : 0
        source: "../resources/fly_neko.png"
    }
}