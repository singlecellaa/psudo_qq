import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects
import ".."

Page{
    id: root
    anchors.fill: parent

    property string textInputContent
    property var messageModels: stackLayout3.messageModels
    property int messageIndex
    property string imagePath: "../../resources/"
    property int column2Width: 250

    signal send()
    onSend: {
        console.log("root connect")
        if(textInputContent == "")
            console.log("no input")
        else
            messageModels[messageIndex].append({"sender":0,"theText": textInputContent})
    }

    Row {
        anchors.fill: parent

        //COLUMN1
        Rectangle{
            width: column1.width
            height: root.height
            color: "#d9d8d2"
            
            Column{
                id: column1
                spacing: 10
                width: 60
                Image{ id: col1_top_icon; source: imagePath + "qq5.png"; width: 50; height: 40; fillMode: Image.PreserveAspectFit; anchors.horizontalCenter: parent.horizontalCenter}
                Avatar{id: col1_avatar; x: col1_top_icon.x + 8}
                ListView{
                    id: icon_listView
                    width: parent.width
                    height: root.height - col1_top_icon.height - col1_avatar.height - 30
                    x: 10
                    model: ListModel{
                        ListElement{icon: "chat1_icon.png"; h_icon: "chat2_icon.png"}
                        ListElement{icon: "pal1_icon.png"; h_icon: "pal2_icon.png"}
                    }
                    delegate: Col1Icon{ icon_: model.icon; h_icon_: model.h_icon; x: col1_top_icon.x+7}
                }
            }
        }
        //COLUMN2
        Rectangle{
            width: column2Width
            height: root.height
            color: "white"
            Column{
                id: column2_1
                width: column2Width
                //top row for search
                Row{
                    spacing: 10
                    x: 20
                    Rectangle{
                        id: topRect
                        y: 10
                        width: 150
                        height: 23
                        color: "lightGrey"
                        radius: 4
                        opacity: 0.5
                        layer.enabled: true
                        Row{
                            Image{source: imagePath + "search_icon.png"}
                            Rectangle{
                                width: 50
                                height: 23
                                radius: 6
                                color: "lightGrey"
                                opacity: 0.5
                                layer.enabled: true
                                TextInput{
                                    id: textInput
                                    anchors.fill: parent
                                    cursorVisible: false
                                    verticalAlignment: Text.AlignVCenter
                                    font.weight: Font.Bold
                                    Text{
                                        id: text
                                        anchors.verticalCenter: parent.verticalCenter
                                        text: textInput.text == "" ? "搜索" : ""
                                        color: "grey"
                                        font.weight: Font.Bold
                                    }
                                }
                            }
                        }
                    }
                    Image{ width: 30; height: 30; y: 5; source: imagePath + "add_icon.png" }
                }
                Space{}
                //column2 main layout
                StackLayout{
                    id: stackLayout2
                    // height: 
                    //chat list view
                    ListView{
                        id: col2ChatListView
                        model: ListModel{
                            ListElement {icon: "qq4.png"; name: "group1"; time: "2024/08/20"}
                            ListElement {icon: "kaju.png"; name: "kaju"; time: "2024/08/22"}
                        }
                        delegate: Rectangle{
                            id: column2Rect
                            width: column2Width
                            height: 80
                            color: "lightGrey"
                            Row{
                                spacing: 10
                                Space{ width: 5}
                                Avatar{fileName: model.icon; width: 50; y: column2Rect.height / 2 - height / 2}
                                Rectangle{
                                    width: 180; height: column2Rect.height
                                    color: "transparent"
                                    Text {id: theName;  text: model.name; font.pointSize: 12; y: 10; anchors.left: parent.left}
                                    Text {id: lastTime; text: model.time; color: "grey";      y: 12; anchors.right: parent.right; anchors.rightMargin: 15}
                                }
                            }
                            MouseGrey{
                                onClicked: {
                                    col2ChatListView.currentIndex = index
                                    root.messageIndex = index
                                    stackLayout3.currentIndex = index + 1; 
                                    console.log("root.messageIndex: " + root.messageIndex)
                                    console.log("stackLayout3 index: " + stackLayout3.currentIndex)
                                }
                            }
                        }
                    }
                    //notice & pal list view
                    Column{
                        id: column2_2
                        //好友管理器
                        Rectangle{
                            width: 220; height: 30
                            x: 15; radius: 4
                            border{color: Qt.darker("lightGrey",1.2); width: 1 }
                            Row{
                                anchors.centerIn: parent
                                Image{ source: imagePath + "people_icon.png" }
                                Text{y: 3; text: "好友管理器" }
                            }
                            MouseLightGrey{}
                        }
                        Space{}
                        //通知
                        Repeater{
                            id: noticeRepeater
                            model: ["好友通知","群通知"]
                            delegate: Rectangle{
                                id: column2Rect2
                                width: column2Width; height: 30
                                Text {text: modelData; y: 10; anchors.left: parent.left; anchors.leftMargin: 15}
                                Image {source: imagePath + "arrow_icon.png"; anchors.right: parent.right; anchors.rightMargin: 10; y: 4}
                                MouseArea{
                                    anchors.fill: parent
                                    hoverEnabled: true
                                    onEntered: parent.color = "lightGrey"
                                    onExited: parent.color = "white"
                                    onClicked: stackLayout3.currentIndex =  1
                                }
                            }
                        }
                        Space{height: 10}
                        //查看好友&群聊
                        //tabBar
                        Rectangle{
                            width: 200
                            height: 30
                            x: parent.width/2 - width / 2
                            radius: 8
                            color: "#f7f7f7"
                            TabBar{
                                id: tabBar
                                width: parent.width - 20
                                height: parent.height
                                anchors.centerIn: parent
                                anchors.verticalCenterOffset: 5
                                background: Rectangle{
                                    radius: 8
                                    color: "transparent"
                                }
                                TabButton{
                                    text: "好友"
                                    checkable: true
                                    checked: true
                                    onClicked: pal_and_group.currentIndex = 0
                                    background: Rectangle{
                                        radius: 6
                                        color: tabBar.currentIndex === 0 ? "white" : "transparent"
                                    }
                                    contentItem: Text{
                                        text: "好友"
                                        color: tabBar.currentIndex === 0 ? "#0e9bed" : "gray"
                                        anchors.centerIn: parent
                                    }
                                }
                                TabButton{
                                    text: "群聊"
                                    checkable: true
                                    onClicked: pal_and_group.currentIndex = 1
                                    background: Rectangle{
                                        radius: 6
                                        color: tabBar.currentIndex === 1 ? "white" : "transparent"
                                    }
                                    contentItem: Text{
                                        text: "群聊"
                                        color: tabBar.currentIndex === 1 ? "#0e9bed" : "gray"
                                        anchors.centerIn: parent
                                    }
                                }
                            }
                        }
                        StackLayout{
                            id: pal_and_group
                            width: parent.width
                            height: 500
                            Col2ListView{col2Model_: pal_model; col2Models_: pal_and_group.palModels}
                            ListModel{
                                id: pal_model
                                ListElement{name: "我的设备"; num: ""}
                                ListElement{name: "机器人"}
                            }
                            ListModel{
                                id: apparatus_model
                                ListElement{name: "我的手机"; icon: "phone_icon.png"}
                            }
                            ListModel{
                                id: bot_model
                                ListElement{name: "babyQ"; icon: "babyQ_icon.png"}
                            }
                            property var palModels: [apparatus_model, bot_model]
                            Col2ListView{col2Model_: col2_group_model; col2Models_: pal_and_group.groupModels}
                            ListModel{
                                id: col2_group_model
                                ListElement{name: "置顶群聊"; num: ""}
                                ListElement{name: "我加入的群聊"}
                            }
                            ListModel{
                                id: group_on_top
                                ListElement{name: "kaju"; icon: "kaju.png"}
                                ListElement{name: "yanami"; icon: "yanami.png"}
                            }
                            ListModel{
                                id: entered_group
                                ListElement{name: "kaju"; icon: "kaju.png"}
                                ListElement{name: "yanami"; icon: "yanami.png"}
                                ListElement{name: "higashi_no_eden"; icon: "higashi_no_eden.png"}
                            }
                            property var groupModels: [group_on_top, entered_group]
                        }
                    }
                }
            }
        }
        //LAYOUT3
        Rectangle{
            width: parent.width - column2Width
            height: parent.height
            color: Qt.lighter("lightGrey",1.15)
            StackLayout{
                id: stackLayout3
                anchors.fill: parent
                //default rect
                Rectangle{
                    id: defaultRect
                    color: "transparent"
                    Image{source: imagePath + "qq6.png";  anchors.centerIn: parent}
                }
                //chat layer
                Repeater{
                    id: chatRepeater
                    model: group_model
                    delegate: Rectangle{
                        color: "transparent"
                        //top menu
                        Rectangle{
                            id: topMenu
                            color: "transparent"
                            width: parent.width; height: 40
                            Text{
                                text: name + "(" + people + ")"; 
                                font.pointSize: 12; 
                                anchors.verticalCenter: parent.verticalCenter; 
                                x: 20
                            }
                        }
                        //menu line
                        Rectangle{
                            id: line
                            anchors.top: topMenu.bottom
                            width: parent.width; height: 1
                            color: "lightGrey"
                        }
                        //message view
                        ScrollView{
                            id: scrollView
                            width: parent.width
                            height: parent.height - topMenu.height - bottomRect.height
                            anchors.top: topMenu.bottom
                            anchors.topMargin: 10
                            anchors.bottom: bottomRect.top
                            Column{
                                width: parent.width
                                spacing: 10
                                Repeater{
                                    id: messageRepeater
                                    model: stackLayout3.messageModels[col2ChatListView.currentIndex]
                                    delegate: Message{scrollViewWidth: scrollView.width}
                                }
                            }
                            
                        }
                        //bottom input rect
                        Rectangle{
                            id: bottomRect
                            width: parent.width; height: line2.height + inputRect.height + icon_row.height
                            anchors.bottom: parent.bottom
                            color: "transparent"
                            //line2
                            Rectangle{
                                id: line2
                                anchors.top: bottomRect.top
                                width: parent.width; height: 1
                                color: "lightGrey"
                                MouseArea{
                                    id: dragArea
                                    width: parent.width
                                    height: 4
                                    cursorShape: Qt.SizeVerCursor
                                    drag.target: line2
                                    drag.axis: Drag.YAxis
                                    drag.smoothed: false
                                    onPositionChanged: {
                                        let relativePos = mapToItem(null, mouseX, mouseY);
                                        let newHeight = root.height - relativePos.y
                                        if( newHeight >= 50){
                                            inputRect.height = newHeight - icon_row.height - height
                                        }
                                    }
                                }
                            }  
                            //icon row 
                            ListView{
                                id: icon_row
                                width: parent.width; height: 30; spacing: 0; leftMargin: 10; topMargin: 5
                                anchors.top: line2.bottom
                                orientation: ListView.Horizontal
                                model: ListModel{
                                    ListElement{icon: "emoji1_icon.png"; h_icon: "emoji2_icon.png"}
                                    ListElement{icon: "cut1_icon.png"; h_icon: "cut2_icon.png"}
                                    ListElement{icon: "file1_icon.png"; h_icon: "file2_icon.png"}
                                    ListElement{icon: "image1_icon.png"; h_icon: "image2_icon.png"}
                                }
                                delegate: Rectangle{
                                    width: 40; height: width
                                    color: "transparent"
                                    x: col1_top_icon.x + 7
                                    radius: 4
                                    Image{
                                        id: icon1
                                        anchors.centerIn: parent
                                        width: 20
                                        height: 20
                                        fillMode: Image.PreserveAspectCrop
                                        source: imagePath + icon
                                    }
                                    MouseArea {
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: icon1.source = imagePath + h_icon
                                        onExited: icon1.source = imagePath + icon
                                        onClicked: {
                                            icon_row.currentIndex = index
                                        }
                                    }
                                }
                            }
                            InputRect {id: inputRect; anchors.top: icon_row.bottom}
                        }
                        Item{
                            Binding{
                                target: root
                                property: "textInputContent"
                                value: inputRect.theText
                            }
                        }
                        Component.onCompleted: {
                            inputRect.onSend.connect(send)
                        }
                    }
                }

                ListModel{
                    id: notice_model
                    ListElement{name: "好友通知"}
                    ListElement{name: "群通知"}
                }
                ListModel{
                    id: pal_notice_model
                    ListElement {icon: ""; name: ""; content: ""; message: ""}
                }
                ListModel{
                    id: group_notice_model
                }
                property var noticeModels: [pal_notice_model, group_notice_model]

                ListModel{
                    id: group_model
                    ListElement{name: "group1"; people: 4}
                    ListElement{name: "kaju"; people: 2}
                }
                ListModel{id: group1_message}
                ListModel{id: kaju_messsage}
                property var messageModels: [group1_message, kaju_messsage]
            }
        }
    }
}