import QtQuick 2.0

import "../../General"
import "../.."

Item {
    property string defaultText: "Type something..."

    readonly property TextInput inputArea: inpt

    property string entry: inpt.text.replace("\t","    ")

    id: root

    signal activate()
    signal goNext()

    onActivate: inpt.forceActiveFocus()

    AppText
    {
        fontPrototype: Style.font_p
        text: "List all current citizenships:"
        font.pixelSize: 46
    }

    Rectangle
    {
        id: box
        color: "white"
        width: 704
        height: 290
        y: 80
    }

    Rectangle
    {
        anchors.fill: box
        color: Style.orange
        opacity: inpt.focus ? 0.16 : 0.0
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }

    TextInput
    {
        id: inpt
        font.family: tip_text.font.family
        anchors.fill: box
        anchors.margins: 46
        color: Style.orange
        font.pixelSize: 40
        cursorVisible: focus

        Keys.onTabPressed: root.goNext()
    }

    AppText
    {
        id: tip_text
        anchors.left: box.left
        anchors.top: box.top
        anchors.margins: 46
        color: Style.orange
        font.pixelSize: inpt.font.pixelSize
        fontPrototype: Style.font_p
        text: root.defaultText
        opacity: 0.8
        visible: !inpt.focus && inpt.text === ""
    }
}
