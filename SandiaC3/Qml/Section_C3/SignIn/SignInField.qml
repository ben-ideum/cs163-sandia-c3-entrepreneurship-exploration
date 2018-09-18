import QtQuick 2.0

import "../../General"
import "../.."

Rectangle {
    property string defaultText: "Required"
    property string fieldName: "First Name"
    property bool isEmail: false

    readonly property TextInput inputArea: inpt

    property string entry: inpt.text.replace("\t","    ")

    id: root

    height: 115
    width: 834

    color: "white"

    signal throwError(string error)
    signal activate()
    signal goNext()

    onActivate: inpt.forceActiveFocus()

    Rectangle
    {
        anchors.fill: inpt
        color: Style.orange
        opacity: inpt.focus ? 0.16 : 0.0
        Behavior on opacity { NumberAnimation { duration: 200 } }
        anchors.leftMargin: -46
    }

    TextInput
    {
        id: inpt
        font.family: tip_text.font.family
        anchors.fill: parent
        anchors.leftMargin: 46
        color: Style.orange
        font.pixelSize: parent.height/3.5
        verticalAlignment: Text.AlignVCenter
        cursorVisible: true
        onFocusChanged: if (focus) { error_anim.stop() } else { test() }

        Keys.onTabPressed: root.goNext()

        onAccepted: test()

        function test() {
            if (root.isEmail) {
                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                if (!inpt.text.match(re)) {
                    inpt.text = ""
                    root.throwError("Please enter a valid e-mail...");
                }
            }
        }
    }
    Rectangle
    {
        anchors.right: parent.left
        width: 231
        height: parent.height
        color: Style.orange

        AppText
        {
            id: tip_text
            anchors.fill: parent
            anchors.leftMargin: 46
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            color: "white"
            font.pixelSize: parent.height/4.5
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
        visible: !inpt.focus && inpt.text === ""
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
            script: { error_field.visible = true; error_overlay.opacity = 0 }
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

    onThrowError:
    {
        error_text.txt = error
        error_anim.start()
    }
}
