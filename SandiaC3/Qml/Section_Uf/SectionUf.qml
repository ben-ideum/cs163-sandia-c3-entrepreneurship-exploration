import QtQuick 2.0

import "../General"

Item {

    readonly property var fields: [landing, crf]

    id: root

    anchors.fill: parent

    UfLanding
    {
        id: landing
        state: "SHOWING"
        bubbleState: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onGo: root.goTo(num)
        onBackClicked: if (sidebar.activeArea == 0) { state = "HIDDEN" } else { root.goTo(0) }
    }

    UfPopupScreen
    {
        id: crf
        marker_loc: landing.crf_loc
        state: "SHOWING"
    }

    Sidebar
    {
        id: sidebar
        buttons: ["SNL Map", "CRF", "CINT", "DETL", "NSTTF", "SWiFT"]
    }

    function goTo(num) {
        sidebar.activeArea = num
    }

    function goHome() {
        sidebar.activeArea = 0
    }
}
