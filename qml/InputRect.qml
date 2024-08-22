import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Flickable{
    id: root
    // color: "transparent"
    signal send()

    property string theText

    width: parent.width
    height: 100
    TextInput{
        id: textInput
        anchors.fill: parent
        cursorVisible: true
    }
    Button{
        id: button
        width: text.width + 10
        height: text.height + 2
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        background: Rectangle{
            anchors.fill: parent
            color: "lightBlue"
        }
        Text{
            id: text
            anchors.centerIn: parent
            text: "send"
        }
        onClicked: {
            theText = textInput.text
            textInput.clear()
        }
    }
    Component.onCompleted: {
        button.onClicked.connect(send)
    }
}