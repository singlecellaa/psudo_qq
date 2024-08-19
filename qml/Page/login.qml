import QtQuick
import QtQuick.Controls
import ".."

Page{
    id: root
    title: qsTr("Login")

    background: Rectangle{
        anchors.fill: parent
        color: "#29134f"
    }
    

    signal send()
    
    signal send2()

    signal send3()
    onSend3: moreChoice.open()

    Column{
            anchors.centerIn: parent
            spacing: 20
            Image{
                
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../../resources/qq4.png"
            }
            Column{
                spacing: 12
                Repeater{
                    model: ["输入QQ号","输入QQ密码"]
                    delegate: Rectangle{
                        id: inputRect
                        width: 250
                        height: 40
                        radius: 4
                        color: "grey"
                        opacity: 0.5
                        TextInput{
                            id: textInput
                            anchors.fill: parent
                            cursorVisible: false
                            verticalAlignment: Text.AlignVCenter
                            horizontalAlignment: Text.AlignHCenter
                            font.pointSize: 12
                            Text{
                                id: text
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.horizontalCenter: parent.horizontalCenter
                                text: textInput.text == "" ? " " + modelData : ""
                                color: "lightGrey"
                                font.weight: Font.DemiBold
                            }
                        }
                    }
                }
                CheckBox{
                    Text{
                        text: "已阅读并同意服务协议和隐私保护指引"
                        color: "lightGrey"
                    }
                }
                
            }
            OpButton{
                id: login
                width: 250
                height: 37
                radius: 4
                operation: "登录"
                theColor: "#2c51f5"
            }
            Rectangle{
                width: 10
                height: 8
                color: "transparent"
            }
            Menu{
                id: moreChoice
                width: choiceRow.width / 2
                background: Rectangle{
                    anchors.fill: parent
                    color: "#21263b"
                    radius: 4
                    border{
                        width: .2
                        color: "lightGrey"
                    }
                }
                Repeater{
                    model: ["注册账号","忘记密码"]
                    delegate: MenuItem{
                        height: 25
                        background: Rectangle{
                            anchors.fill: parent
                            color: "#21263b"
                        }
                        Text{
                            text: modelData
                            anchors.horizontalCenter: parent.horizontalCenter      
                            anchors.verticalCenter: parent.verticalCenter
                            color: "white"
                        }
                    }
                }
                x: choiceRow.x + choiceRow.width / 2
                y: choiceRow.y - moreChoice.height
            }
            Row{
                id: choiceRow
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 0
                Repeater{
                    id: repeater
                    model: ["扫码登录","更多选项"]
                    delegate: Button{
                        id: button2
                        width: 80
                        height: 30
                        background: Rectangle{
                            anchors.fill: parent
                            color: "transparent"
                        }
                        hoverEnabled: false
                        HoverHandler {
                            id: mouse
                            acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
                            cursorShape: Qt.PointingHandCursor
                        }
                        Text{
                            anchors.centerIn: parent
                            text: modelData
                            font.pointSize: 12
                            color: "#3659f5"
                        }
                    }
                }
            }
    }
    
    Component.onCompleted: {
        login.onClicked.connect(send)
        repeater.itemAt(0).onClicked.connect(send2)
        repeater.itemAt(1).onClicked.connect(send3)
    }
    
}