import QtQuick
import Qt5Compat.GraphicalEffects
Image {
    id: avatar

    property string imagePath: "../../resources/"
    property string fileName: "fly_neko.png"

    width: 40
    height: width
    fillMode: Image.PreserveAspectCrop
    source: imagePath + fileName
    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Item {
            width: avatar.width
            height: width
            Rectangle {
                anchors.centerIn: parent
                width: avatar.width
                height: width
                radius: width / 2
            }
        }
    }

}
