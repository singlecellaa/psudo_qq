import QtQuick
import QtQuick.Controls

Item{
    property var component;
    property var scrollView;
    property string textInput;
    
    signal send()
    onSend: {
        console.log("manager connect")
    }

    function createMessageObject() {
        component = Qt.createComponent("Message.qml");
        if (component.status === Component.Ready || component.status === Component.Error) {
            finishCreation();
        } else {
            component.statusChanged.connect(finishCreation);
        }
    }

    function finishCreation() {
        if (component.status === Component.Ready) {
            var message = component.createObject(scrollView, {sender: 0, theText: textInput });
            if (message === null) {
                console.log("Error creating message");
            }
        } else if (component.status === Component.Error) {
            console.log("Error loading component:", component.errorString());
        }
    }
}

