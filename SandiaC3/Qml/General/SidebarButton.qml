import QtQuick 2.0

import ".."

Item {
    property alias text: txt.text
    property bool selected: false

    id: root

    width: parent.width
    height: Style.resolution.y * 0.1

    signal clicked()

    Rectangle
    {
        anchors.fill: parent

        color: root.selected ? Style.cyan : "white"

        Behavior on color { ColorAnimation { duration: 200 } }
    }

    Rectangle { height: 2; width: parent.width; color: Style.slate; opacity: root.selected ? 0.0 : 0.4; Behavior on opacity { NumberAnimation { duration: 400 } } }

    AppText
    {
        id: txt
        anchors.fill: parent
        anchors.leftMargin: parent.height/3
        font.pixelSize: parent.height/5
        verticalAlignment: Text.AlignVCenter
        color: root.selected  ? "white" : Style.charcoal

        Behavior on color { ColorAnimation { duration: 200 } }
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
