import QtQuick 2.0

import ".."

FadeState {
    anchors.fill: parent
    anchors.topMargin: Style.headerSize
    anchors.bottomMargin: Style.footerSize

    onOpacityChanged: if (opacity === 0.0) { hidden() }

    signal hidden()
}
