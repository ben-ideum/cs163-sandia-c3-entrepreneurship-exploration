import QtQuick 2.0

import "../../General"
import "../.."

Item {
    property bool citizen: false

    id: root

    signal activate()
    signal goNext()

    onActivate: yes_btn.forceActiveFocus()

    AppText
    {
        fontPrototype: Style.font_p
        text: "Are you a U.S. citizen?"
        font.pixelSize: 46
    }

    Rectangle
    {
        color: "white"
        y: 80
        width: 704
        height: 290

        Rectangle
        {
            id: yes_btn
            radius: 20
            width: 76
            height: 76
            x: 40
            y: 40
            border.width: 2
            border.color: Style.orange
            color: root.citizen ? Style.orange : "white"
            Behavior on color { ColorAnimation { duration: 150 } }

            Rectangle
            {
                anchors.centerIn: parent
                width: 26
                height: 26
                radius: 13
                color: "white"
            }

            Rectangle
            {
                anchors.fill: parent
                anchors.margins: -20
                opacity: 0.3
                color: "transparent"
                border.width: 2
                border.color: Style.orange
                visible: parent.focus
                anchors.rightMargin: -150
            }

            Keys.onDownPressed: no_btn.forceActiveFocus()

            Keys.onUpPressed: no_btn.forceActiveFocus()

            Keys.onReturnPressed: root.citizen = true

            Keys.onTabPressed: root.goNext()
        }

        AppText
        {
            id: yes_txt
            anchors.verticalCenter: yes_btn.verticalCenter
            anchors.left: yes_btn.right
            anchors.leftMargin: 20
            text: "Yes"
            color: Style.orange
            fontPrototype: Style.font_p_bold
            font.pixelSize: yes_btn.height / 2
            anchors.verticalCenterOffset: height/6
        }

        MouseArea
        {
            anchors.left: yes_btn.left
            anchors.top: yes_btn.top
            anchors.bottom: yes_btn.bottom
            anchors.right: yes_txt.right
            anchors.margins: -20
            onClicked: { root.citizen = true; yes_btn.forceActiveFocus() }
        }

        Rectangle
        {
            id: no_btn
            radius: 20
            width: 76
            height: 76
            x: 40
            y: 156
            border.width: 2
            border.color: Style.orange
            color: !root.citizen ? Style.orange : "white"
            Behavior on color { ColorAnimation { duration: 150 } }

            Rectangle
            {
                anchors.centerIn: parent
                width: 26
                height: 26
                radius: 13
                color: "white"
            }

            Rectangle
            {
                anchors.fill: parent
                anchors.margins: -20
                opacity: 0.3
                color: "transparent"
                border.width: 2
                border.color: Style.orange
                visible: parent.focus
                anchors.rightMargin: -150
            }

            Keys.onDownPressed: yes_btn.forceActiveFocus()

            Keys.onUpPressed: yes_btn.forceActiveFocus()

            Keys.onReturnPressed: root.citizen = false

            Keys.onTabPressed: root.goNext()
        }

        AppText
        {
            id: no_txt
            anchors.verticalCenter: no_btn.verticalCenter
            anchors.left: no_btn.right
            anchors.leftMargin: 20
            text: "No"
            color: Style.orange
            fontPrototype: Style.font_p_bold
            font.pixelSize: no_btn.height / 2
            anchors.verticalCenterOffset: height/6
        }

        MouseArea
        {
            anchors.left: no_btn.left
            anchors.top: no_btn.top
            anchors.bottom: no_btn.bottom
            anchors.right: no_txt.right
            anchors.margins: -20
            onClicked: { root.citizen = false; no_btn.forceActiveFocus() }
        }
    }
}
