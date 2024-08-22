import QtQuick
import QtQuick.Controls

ListView{
    id: root
    property var col2Model_
    property var col2Models_
    property string imagePath: "../resources/"
    interactive: false
    model: col2Model_
    delegate: Rectangle{
        id: unitRect
        width: column2Width
        height: categoryRect.height + listView1.height
        //categoryRect
        Rectangle{
            id: categoryRect
            width: column2Width
            height: 30
            Row{
                id: categoryRow
                spacing: 10
                x: 10
                anchors.verticalCenter: parent.verticalCenter
                Image{
                    source: imagePath + "arrow_icon.png"
                    rotation: unitRect.state === "expanded" ? 90 : 0
                    Behavior on rotation {
                        NumberAnimation{duration: 200}
                    }
                }
                Text {text: model.name; y: 8}
            }
            // people num
            Text{
                text: model.num === "" ? root.col2Models_[index].count : model.num
                anchors.right: parent.right
                anchors.rightMargin: 15
                anchors.verticalCenter: parent.verticalCenter
            }
            MouseLightGrey{
                id: categoryMouseArea
                onClicked: {
                    unitRect.state = unitRect.state === "expanded" ? "" : "expanded"
                    listView1.height = listRect1.height === 0 ? (listView1.count*50) : 0
                    listRect1.height = listRect1.height === 0 ? listView1.height : 0
                    listRect1.visible = listRect1.visible === false ? true : false 
                }
            }
        }
        //listRect
        Rectangle{
            id: listRect1
            visible: false
            height: 0
            width: column2Width
            anchors.top: categoryRect.bottom
            //pal list
            ListView{
                id: listView1
                width: column2Width
                height: 0
                model: root.col2Models_[index]
                delegate: Rectangle{
                    id: deleRect
                    width: column2Width
                    height: 50
                    Row{
                        spacing: 6
                        x: 8
                        Avatar{imagePath: root.imagePath; fileName: model.icon }
                        Text{text: model.name; font.pixelSize: 12; y: parent.height/2 - height/2}
                    }
                }
            }
        }
    }
}