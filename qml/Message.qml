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
        width: text.contentWidth + 20
        height: text.contentHeight + 20
        x: sender === 0 ? image.x - width - 5 : image.width
        y: image.y + image.height / 2
        color: "#438cfa"
        radius: 5
        
        Text{
            id: text
            anchors.centerIn: parent
            width:  implicitWidth > layout3Rect.width - 160 ? layout3Rect.width - 160 : implicitWidth
            text: theText
            font.pointSize: 10
            color: "white"
            wrapMode: Text.Wrap
            textFormat: Text.RichText
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