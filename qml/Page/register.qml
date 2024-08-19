import QtQuick
import QtQuick.Controls
import ".."


Page{
    id: root
    
    background: Image{
        source: "../../resources/register_background.jpg"
    }

    anchors.fill: parent
    signal send()
    onSend: {
        console.log("send1")
    }
    signal send2()
    onSend2: {
        console.log("send2")
    }
    Image{
        source: "../../resources/qq3.png"
        x: 30
        y: 20
    }
    Row{
        topPadding: 10
        anchors.right: parent.right
        spacing: 20
        Control{
            id: icon
            contentItem: Image{
                source: "../../resources/qq_account.png"
            }
        }
        
        
        Column{
            id: langColumn
            y: 5
            Button{
                id: langMenuButton
                text: "简体中文"
                font.pointSize: 12
                hoverEnabled: false
                background: Rectangle{
                anchors.fill: parent
                color: "transparent"
                }
                MouseArea{
                    width: langColumn.width
                    height: langColumn.height
                    hoverEnabled: true
                    onEntered: langMenu.visible = true
                    onExited: langMenu.visible = false
                }
            }
            Column{
                id: langMenu
                visible: false
                Repeater{
                    model: ["繁體中文","English"]
                    delegate: Button{
                        text: modelData
                        font.pointSize: 12
                        hoverEnabled: false
                        background: Rectangle{
                            anchors.fill: parent
                            color: "transparent"
                        }
                    }
                }
            }
        }
        
        
        Button{
            anchors.verticalCenter: icon.verticalCenter
            hoverEnabled: false
            text: "意见反馈"
            font.pointSize: 12
            background: Rectangle{
                width: 100
                height: 50
                color: "transparent"
            }
        }

    }
    Column{
        anchors.centerIn: parent
        width: 150
        spacing: 10
        Text{
            text: "欢迎注册"
            font.pointSize: 20
        }
        Text{
            text: "每一天，乐在沟通"
            font.pointSize: 10
        }
        Repeater{
            model: ["昵称","密码"]
            delegate: MyTextInput{theText: modelData}
        }
        Row{
            Button{
                id: regionButton
                width: 40
                height: 30
                text: "+86"
                font.pointSize: 10
                hoverEnabled: false
                background: Rectangle{
                    anchors.fill: parent
                    color: "white"
                }
                onClicked: regionMenu.open()
                Menu{
                    id: regionMenu
                    y: regionButton.height
                    Repeater{
                        model: ["+86","+852","+853","+886"]
                        MenuItem{
                            text: modelData
                        }
                    }
                }
            }
            MyTextInput{theText: "手机号码"; width: 140}
        }
        Row{
            MyTextInput{theText: "短信验证码"; width: 100}
            Button{
                background: Rectangle{
                    color: "white"
                    width: 80
                    height: 30
                    Text{
                        text: "发送验证码"
                        color: "lightGrey"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        anchors.rightMargin: 3
                    }
                }
                
            }
        }
        CheckBox{
            text: "我已阅读并同意服务协议和隐私保护指引"
        }
        Row{
            spacing: 20
            OpButton{
                id: register
                width: 80
                operation: "立即注册"
                theColor: "#2c51f5"
            }
            OpButton{
                id: cancel
                width: 80
                operation: "取消"
                theColor: "red"
            }
        }
        Component.onCompleted: {
            register.onClicked.connect(send)
            cancel.onClicked.connect(send2)
        }
    }
}