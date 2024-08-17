import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Item{
    id: root
    anchors.fill: parent
    ChatManager{id: chatManager}

    property int currentIndex
    signal send()
    onSend: console.log("chat page send")

    Column{
        id: column
        Repeater{
            id: peopleNum
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

        Repeater{
            id: layoutRepeater
            model: peopleNum.count
            delegate: Rectangle{
                color: "grey"
                ScrollView{
                    id: scrollView
                    width: parent.width
                    height: parent.height - inputRect.height
                    Column{
                        anchors.fill: parent
                        spacing: 10
                        Repeater{
                            model: ListModel{
                                ListElement {theContent: "hello"; sender: 0}
                                ListElement {theContent: "hello"; sender: 1}
                            }
                            delegate: Rectangle{
                                anchors.right: parent.right
                                width: 100
                                height: 20
                                Text{
                                    anchors.centerIn: parent
                                    text: "say " + model.sender + " " + model.theContent
                                    font.pointSize: 10
                                }
                            }
                        }
                    }
                }
                InputRect {id: inputRect}
                Component.onCompleted: {
                    inputRect.onSend.connect(send)
                }
            }
        }
    }
    Item{
        Connections{
            target: root
            onSend: {
                console.log("input connect")
            }
        }
    }
    Binding {
        target: root
        property: "currentIndex"
        value: stackLayout.currentIndex
    }
    Component.onCompleted: {
        root.onSend.connect(chatManager.send)
    }
}