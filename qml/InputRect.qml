import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Rectangle{
    id: root
    signal send()

    color: "transparent"
    property string theText

    width: parent.width
    height: 100
    focus: true
    TextInput{
        id: textInput
        anchors.fill: parent
        cursorVisible: true
    }
    OpButton{
        id: button
        width: 80
        height: 25
        operation: "发送"
        theColor: "#438cfa"
        x: root.width - width - 80
        y: root.height - height - 20
        onClicked: {
            theText = textInput.text
            textInput.clear()
        }
    }

    Component.onCompleted: {
        button.onClicked.connect(send)
    }
}