import QtQuick 2.0

import "../General"
import ".."

Row {
    property int activePage: 0

    id: root

    height: 100
    spacing: 2

    signal goPrevious()
    signal goNext()
    signal goTo(int num)

    Rectangle
    {
        color: "white"
        height: parent.height
        width: prev.contentWidth+height

        border.color: Style.gray
        border.width: 2

        AppText
        {
            id: prev
            text: "Previous"
            font.pixelSize: parent.height/3
            anchors.centerIn: parent
            color: Style.slate
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: root.goPrevious()
        }
    }

    Repeater
    {
        model: 4

        Rectangle
        {
            readonly property bool active: root.activePage == index
            height: parent.height
            width: 75

            border.color: Style.gray
            border.width: 2
            color: active ? Style.cyan : "#FFFCFC"
            Behavior on color { ColorAnimation { duration: 200 } }

            AppText
            {
                anchors.centerIn: parent
                text: index+1
                font.pixelSize: parent.height/3
                color: parent.active ? "white" : "black"
                Behavior on color { ColorAnimation { duration: 200 } }
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: root.goTo(index)
            }
        }
    }

    Rectangle
    {
        color: "white"
        height: parent.height
        width: nxt.contentWidth+height

        border.color: Style.gray
        border.width: 2

        AppText
        {
            id: nxt
            text: "Next"
            font.pixelSize: parent.height/3
            anchors.centerIn: parent
            color: Style.slate
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked: root.goNext()
        }
    }
}
