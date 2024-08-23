import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

Rectangle{
    id: root
    signal send()

    color: "transparent"
    property string theText

    width: parent.width
    height: 100 
    focus: true

    Flickable{
        id: flickable
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.topMargin: 8
        anchors.rightMargin: 100
        anchors.bottomMargin: 45
        clip: true
        function ensureVisible(r){
            if(contentY >= r.y)
                contentY >= r.y 
            else if (contentY + height <= r.y + r.height)
                contentY = r.y + r.height - height
        }
        TextEdit{
            id: textInput
            anchors.fill: parent
            cursorVisible: false
            wrapMode: TextEdit.Wrap
            textFormat: TextEdit.RichText
            onCursorRectangleChanged: flickable.ensureVisible(cursorRectangle)
            Keys.onPressed: function(event){
                if(event.key === Qt.Key_V && event.modifiers & Qt.ControlModifier){
                    var content = clipboardHandler.getClipboardContent();
                    if(content !== ""){
                        textInput.insert(textInput.cursorPosition,content)
                    }
                    event.accepted = true
                }
            }
        }
    }
    OpButton{
        id: button
        width: 80
        height: 25
        operation: "发送"
        theColor: "#438cfa"
        x: root.width - width - 80
        y: root.height - height - 20
        onClicked: {
            theText = textInput.text
            textInput.clear()
        }
    }

    Component.onCompleted: {
        button.onClicked.connect(send)
    }
}