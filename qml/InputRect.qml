import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Rectangle{
    id: root
    
    signal send()
    onSend:{
        console.log("inputRect send")
    }

    property string theText

    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width - 50
    height: 100
    border.width: 2
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
            border.width: 2
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