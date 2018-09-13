import QtQuick 2.0

import "../../General"
import "../.."

Rectangle {
    property string defaultText: "Select Visitor Type"
    property string fieldName: "Visitor Type"

    property string choice: ""

    id: root

    height: 115
    width: 834

    color: "white"

    signal throwError(string error)

    MouseArea
    {
        id: inpt
        anchors.fill: parent
        anchors.leftMargin: 46
        onClicked: if (!focus) { forceActiveFocus() } else { root.forceActiveFocus() }
        onFocusChanged: if (focus) { error_anim.stop(); }
    }

    AppText
    {
        anchors.fill: parent
        anchors.leftMargin: 46
        color: Style.orange
        font.pixelSize: parent.height/3.5
        verticalAlignment: Text.AlignVCenter
        text: root.choice
        fontPrototype: Style.font_p_bold
    }

    Rectangle
    {
        anchors.right: parent.left
        width: 231
        height: parent.height
        color: Style.orange

        AppText
        {
            anchors.fill: parent
            anchors.leftMargin: 46
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.pixelSize: parent.height/5
            fontPrototype: Style.font_p_bold
            text: root.fieldName
        }
    }

    AppText
    {
        anchors.fill: parent
        anchors.leftMargin: 46
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        color: Style.orange
        font.pixelSize: parent.height/3
        fontPrototype: Style.font_p
        text: root.defaultText
        opacity: 0.8
        visible: root.choice === ""
    }

    Rectangle
    {
        id: error_field
        anchors.fill: parent
        color: "#EBB8B8"
        visible: false

        AppText
        {
            property string txt: ""
            id: error_text
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#9F4F48"
            text: "<b>ERROR!</b> "+txt
            font.pixelSize: parent.height/3
        }

        Rectangle
        {
            id: error_overlay
            anchors.fill: parent
            color: "white"
        }
    }

    SequentialAnimation
    {
        id: error_anim
        ScriptAction
        {
            script: { error_field.visible = true; error_overlay.opacity = 0; }
        }

        PauseAnimation {
            duration: 1000
        }
        NumberAnimation
        {
            target: error_overlay
            property: "opacity"
            from: 0
            to: 1
            duration: 1500
        }
        onRunningChanged: if (!running) { error_field.visible = false }
    }

    Rectangle
    {
        color: "white"
        anchors.top: parent.bottom
        anchors.topMargin: 2
        anchors.right: parent.right
        width: 588
        height: inpt.focus ? 470 : 0
        clip: true
        radius: 5
        Behavior on height { NumberAnimation { duration: 150 } }

        Column
        {
            x: 40
            y: 40
            spacing: 40
            Repeater
            {
                model: ["Industry","Government","Education/School","Sandia Employee","Other"]

                AppText
                {
                    text: modelData
                    color: root.choice === text ? Style.orange : "black"
                    font.pixelSize: 38

                    MouseArea
                    {
                        anchors.fill: parent
                        anchors.margins: -20
                        onClicked:
                        {
                            root.forceActiveFocus()
                            root.choice = modelData
                        }
                    }
                }
            }
        }
    }

    onThrowError:
    {
        if (inpt.focus) {
            inpt.focus = false
        }
        error_text.txt = error
        error_anim.start()
    }
}
