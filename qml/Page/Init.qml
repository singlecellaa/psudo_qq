import QtQuick
import QtQuick.Controls
import ".."

Page{
    id: root
    title: qsTr("Init")

    background: Rectangle{
        anchors.fill: parent
        color: "#29134f"
    }
    

    signal send()
    onSend: console.log("send1")
    
    signal send2()
    onSend2: console.log("send2")

    Column{
            anchors.centerIn: parent
            spacing: 20
            Image{
                
                anchors.horizontalCenter: parent.horizontalCenter
                source: "../../resources/qq1.png"
            }
            Image{
                source: "../../resources/qq2.png"
                sourceSize{
                    width: 200
                    height: 200
                }
            }
            Text{
                
                anchors.horizontalCenter: parent.horizontalCenter
                text: "请使用手机扫码登录"
                color: "white"
                font.pointSize: 13
            }
            Rectangle{
                width: 80
                height: 30
                color: "transparent"
            }
            Row{
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 0
                Repeater{
                    id: repeater
                    model: ["账密登录","注册账号"]
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
        repeater.itemAt(1).onClicked.connect(send)
        repeater.itemAt(0).onClicked.connect(send2)
    }
    
}