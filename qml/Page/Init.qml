import QtQuick
import QtQuick.Controls

Page{
    title: qsTr("Init")
    Column{
            anchors.centerIn: parent
            spacing: 2
            Repeater{
                model: ["register","login"]
                delegate: Button{
                    width: 100
                    height: 30
                    background: Rectangle{
                        anchors.fill: parent
                        color: "lightBlue"
                        border.width: 2
                    }
                    Text{
                        anchors.centerIn: parent
                        text: modelData
                    }
                    onClicked: {

                    }
                }
            }
    }
}