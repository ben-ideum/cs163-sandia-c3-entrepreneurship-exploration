import QtQuick 2.0

import "../General"

Item {

    readonly property var fields: [landing, office_hours, events, signin]

    id: root

    anchors.fill: parent

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

        onBackClicked: root.goHome()
        onMenuClicked: sidebar.show()
    }

    C3Events
    {
        id: events
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onBackClicked: root.goHome()
        onMenuClicked: sidebar.show()
    }

    C3VisitorInformation
    {
        id: signin
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onBackClicked: root.goHome()
        onMenuClicked: sidebar.show()
    }

    Sidebar
    {
        id: sidebar
        buttons: ["C3 Home", "Office Hours", "Events", "Sign-In Form", "Presentation", "White Board"]
    }

    function goTo(num) {
        sidebar.activeArea = num
    }

    function goHome() {
        sidebar.activeArea = 0
    }
}
