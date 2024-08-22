import QtQuick
import QtQuick.Controls
Rectangle{
    property int sender: model.sender
    property string theText: model.theText
    property var scrollViewWidth

    color: "transparent"
    width: text.width + image.width
    height: text.height + image.height

    Rectangle{
        width: text.width + 20
        height: 30
        x: sender === 0 ? image.x - width - 5 : image.width
        anchors.bottom: image.bottom
        color: "#438cfa"
        radius: 5
        
        Text{
            id: text
            anchors.centerIn: parent
            text: theText
            font.pointSize: 10
            color: "white"
        }
    }
    Avatar{
        id: image
        width: 40
        height: 40
        x: sender === 0 ? scrollViewWidth - width - 80 : 0
        source: "../resources/fly_neko.png"
    }
}