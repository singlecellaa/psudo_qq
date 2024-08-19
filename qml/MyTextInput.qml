import QtQuick

Rectangle{
    id: root
    property string theText
    property int theWidth: 180
    width: theWidth
    height: 30
    TextInput{
        id: textInput
        anchors.fill: parent
        focus: true
        verticalAlignment: TextInput.AlignVCenter
        font.pointSize: 12
        Text{
            anchors.verticalCenter: parent.verticalCenter
            text: textInput.text == "" ? " " + theText : ""
            color: "grey"
            font.weight: Font.DemiBold
        }
    }
    radius: 2
}