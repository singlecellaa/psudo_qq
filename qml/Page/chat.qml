import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item{
    anchors.fill: parent
    Column{
        id: column
        Repeater{
            model: ["dialog1","dialog2"]
            Button{
                id: button
                text: modelData
                onClicked: {
                    stackLayout.currentIndex = index
                }
            }
        }
    }
    StackLayout{
        id: stackLayout
        anchors.left: column.right
        width: parent.width - column.width
        height: parent.height
        Rectangle{
            id: backgroundBoard
            color: "red"
            ScrollView{
                width: parent.width
                height: parent.height - inputRect.height
                Text{
                    id: textView
                    anchors.centerIn: parent
                    text: "line\nline\nline"
                    font.pointSize: 100
                }
            }

            Rectangle{
                id: inputRect
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
                        color: "white"
                    }
                    onClicked: {
                        textInput.clear()
                    }
                }
            }

        }
        Rectangle{
            color: "green"
        }
    }
    
}