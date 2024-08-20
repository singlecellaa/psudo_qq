import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import ".."

Page{
    id: root
    anchors.fill: parent
    ChatManager{id: chatManager}

    property string textInput
    property var model 
    property var scrollView
    property string imagePath: "../../resources/"

    signal send()

    Row {
        anchors.fill: parent
        Rectangle{
            width: column1.width
            height: root.height
            color: "#d9d8d2"
            
            Column{
                id: column1
                spacing: 10
                Image{
                    id: qq5
                    source: imagePath + "qq5.png"
                }
                Avatar{x: qq5.x + 10}
                Repeater{
                    id: icon_repeater
                    model: ["chat2.png","pal1.png"]
                    Image{
                        id: icon1
                        x: qq5.x + 7
                        source: imagePath + modelData
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                function updateImage(){

                                }
                                function updateLayout(){

                                }
                            }
                        }
                    }
                }
            }
        }
        Column{
            width: 250
            Row{
                spacing: 10
                x: 20
                Rectangle{
                    y: 10
                    width: 150
                    height: 23
                    color: "lightGrey"
                    Row{
                        Image{
                            source: imagePath + "search_icon.png"
                        }
                        Rectangle{
                            width: 50
                            height: 23
                            radius: 4
                            color: "lightGrey"
                            opacity: 0.5
                            TextInput{
                                id: textInput
                                anchors.fill: parent
                                cursorVisible: false
                                verticalAlignment: Text.AlignVCenter
                                Text{
                                    id: text
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: textInput.text == "" ? "搜索" : ""
                                    color: "grey"
                                    font.weight: Font.DemiBold
                                }
                            }
                        }
                    }
                }
                Image{
                    width: 30
                    height: 30
                    y: 5
                    source: imagePath + "add_icon.png"
                }
            }
            Rectangle{
                width: 20
                height: 10
                color: "transparent"
            }
            StackLayout{
                Column{
                    id: column2
                    width: 100
                    ListView{
                        id: peopleNum
                        model: ListModel{
                            ListElement {icon: ""; name: ""; date_: ""}
                        }
                        delegate: Rectangle{
                            id: button
                            width: column2.width
                            height: 80
                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    stackLayout.currentIndex = index
                                }
                            }
                        }
                    }
                }
            }
        }
        StackLayout{
            id: stackLayout
            width: parent.width - column2.width
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