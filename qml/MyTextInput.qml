import QtQuick

Rectangle{
    id: root
    property string theText
    property string textColor: "grey"
    width: 180
    height: 30
    TextInput{
        id: textInput
        anchors.fill: parent
        focus: true
        verticalAlignment: TextInput.AlignVCenter
        font.pointSize: 12
        Text{
            id: text
            anchors.verticalCenter: parent.verticalCenter
            text: textInput.text == "" ? " " + theText : ""
            color: textColor
            font.weight: Font.DemiBold
        }
    }
    radius: 2
}