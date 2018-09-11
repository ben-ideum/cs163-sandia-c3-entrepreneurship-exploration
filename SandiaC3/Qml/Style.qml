pragma Singleton
import QtQuick 2.0

Item {
    readonly property vector2d resolution: Qt.vector2d(3840, 2160)
    readonly property int headerSize: resolution.y / 4.5
    readonly property int sectionHeaderSize: headerSize * 2 / 3
    readonly property int footerSize: headerSize * 2 / 3 - 40

    property color gray: "#D1D1D1"
    property color slate: "#55595C"
    property color charcoal: "#373A3C"
    property color cyan: "#00A9B7"
    property color dark_cyan: "#74A1AD"

    FontLoader { id: h1; source: "../assets/fonts/Avenir/AvenirLTStd-Medium.otf" }
    FontLoader { id: h1_bold; source: "../assets/fonts/Avenir/AvenirLTStd-Heavy.otf" }
    FontLoader { id: p; source: "../assets/fonts/Gotham/Gotham-Medium.otf" }
    FontLoader { id: p_bold; source: "../assets/fonts/Gotham/Gotham-Bold 2.otf" }

    readonly property QtObject font_h1: QtObject {
        property string font: h1.name
        property real lineHeight: 1
    }

    readonly property QtObject font_h1_bold: QtObject {
        property string font: h1_bold.name
        property real lineHeight: 1
    }

    readonly property QtObject font_p: QtObject {
        property string font: p.name
        property real lineHeight: 1.35
    }

    readonly property QtObject font_p_bold: QtObject {
        property string font: p_bold.name
        property real lineHeight: 1.35
    }
}
