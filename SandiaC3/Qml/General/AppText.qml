import QtQuick 2.0

import ".."

Text {

    property QtObject fontPrototype: Style.font_h1

    property alias delay: fader.delay
    property alias duration: fader.duration

    readonly property real linearState: fader.linearState
    readonly property real inOutState: fader.inOutState

    id: root

    font.family: fontPrototype.font
    lineHeight: fontPrototype.lineHeight
    color: "white"

    state: "SHOWING"

    opacity: fader.opacity

    FadeState
    {
        id: fader
        state: root.state
    }
}
