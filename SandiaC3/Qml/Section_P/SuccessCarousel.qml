import QtQuick 2.0

import "../General"
import ".."

Item {

    property int activeElement: 0

    id: root

    width: 2135
    height: 1403

    signal reset()

    clip: true

    Repeater
    {
        model: 6

        FadeState
        {
            readonly property int diff: index - root.activeElement
            readonly property int nearest: diff > 3 ? diff - 6 : diff < -3 ? diff + 6 : diff
            property bool toRight: false

            onNearestChanged: if (nearest > 0) { toRight = true } else if (nearest < 0) { toRight = false }

            duration: 300
            width: parent.width
            height: parent.height

            state: root.activeElement === index ? "SHOWING" : "HIDDEN"

            Image {
                source: contentPath + "/successes/success-"+(index+1)+".png"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: parent.linearState * 250 * (parent.toRight ? 1 : -1)
                width: parent.width
                height: parent.height
                fillMode: Image.PreserveAspectCrop
            }
        }
    }

    Image {
        source: "../../assets/chevron-left.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 60

        MouseArea
        {
            anchors.fill: parent
            anchors.margins: -40
            onClicked: {
                var tmp = root.activeElement - 1
                if (tmp < 0) { tmp += 6 }
                root.activeElement = tmp
            }
        }
    }

    Image {
        source: "../../assets/chevron-right.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 60

        MouseArea
        {
            anchors.fill: parent
            anchors.margins: -40
            onClicked: root.activeElement = (root.activeElement + 1) % 6
        }
    }

    onReset: activeElement = 0
}
