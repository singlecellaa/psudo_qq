import QtQuick
import QtQuick.Controls

Item{
    property string textInput;
    property var model
    property var scrollView

    signal send()
    onSend: {
        console.log("manager connect")
        if(textInput == "")
            console.log("no input")
        else
            createMessageObject()
    }
    function createMessageObject() {
        model.append({"sender":0,"theText": textInput})
    }
}

