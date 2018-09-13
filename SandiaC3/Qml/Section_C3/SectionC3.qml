import QtQuick 2.0

import "../General"

FadeState {

    readonly property var fields: [landing, office_hours, events, signin]

    id: root

    anchors.fill: parent

    signal launchPresentation();
    signal launchWhiteboard();

    C3Landing
    {
        id: landing
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onGo: root.goTo(num-9)
        onMenuClicked: sidebar.show()
    }

    C3OfficeHours
    {
        id: office_hours
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    C3Events
    {
        id: events
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    C3VisitorInformation
    {
        id: signin
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    Sidebar
    {
        id: sidebar
        buttons: ["C3 Home", "Office Hours", "Events", "Sign-In Form", "Presentation", "White Board"]
        onSetArea: root.goTo(num)
    }

    function goTo(num) {
        if (num === 4) {
            root.launchPresentation()
        } else if (num === 5) {
            root.launchWhiteboard()
        } else {
            sidebar.activeArea = num
        }
    }

    function goHome() {
        sidebar.activeArea = 0
    }
}
