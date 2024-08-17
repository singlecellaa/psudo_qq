import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."

Item{
    id: root
    anchors.fill: parent
    ChatManager{id: chatManager}

    property string textInput
    property var model 
    property var scrollView
    property string imagePath

    signal send()

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
                            id: messageRepeater
                            model: ListModel{}
                            delegate: Message{scrollViewWidth: scrollView.width}
                        }
                    }
                }
                InputRect {id: inputRect}
                Binding{
                    target: root
                    property: "textInput"
                    value: inputRect.theText
                }
                Binding{
                    target: root
                    property: "model"
                    value: messageRepeater.model
                }
                Binding{
                    target: root
                    property: "scrollView"
                    value: scrollView
                }
                Component.onCompleted: {
                    inputRect.onSend.connect(send)
                }
            }
        }
    }
    Item{
        Binding{
            target: chatManager
            property: "textInput"
            value: root.textInput
        }
        Binding{
            target: chatManager
            property: "model"
            value: root.model
        }
        Binding{
            target: chatManager
            property: "scrollView"
            value: root.scrollView
        }
    }
    
    Component.onCompleted: {
        root.onSend.connect(chatManager.send)
    }
}