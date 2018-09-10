import QtQuick 2.0

import ".."

Rectangle {
    property int delay: 0
    property int duration: 400

    readonly property real linearState: fader.linearState
    readonly property real inOutState: fader.inOutState

    property int number: 10
    property string mainText: "C3"
    property string subText: "Center for Collaboration<br>& Commercialization"

    id: root

    color: "transparent"
    border.color: "white"
    border.width: 12

    opacity: fader.opacity

    signal clicked()

    FadeState
    {
        id: fader
        state: root.state

        delay: root.delay
        duration: root.duration
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: root.clicked()
    }

    AppText
    {
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: root.mainText
        font.pixelSize: parent.height * 0.5
    }

    AppText
    {
        width: parent.width * 0.9
        height: parent.height / 6
        y: height/4
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        text: root.number
        font.pixelSize: height * 2 / 3
        font.bold: true
    }

    AppText
    {
        width: parent.width * 0.9
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height / 8
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: height/2
        text: root.subText
        font.pixelSize: height * 0.55
        wrapMode: Text.Wrap
        font.bold: true
    }
}
