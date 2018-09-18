import QtQuick 2.0

import "../General"
import ".."

FadeState {
    property int area: 0

    readonly property var fields: [landing, lt1, lt2, lt3, lt4, lt5, lt6, lt7, lt8, patents, experts]

    id: root

    anchors.fill: parent

    IpLanding
    {
        id: landing
        state: sidebar.activeArea === root.fields.indexOf(this) && root.state === "SHOWING" ? "SHOWING" : "HIDDEN"

        defaultBack: false

        onMenuClicked: sidebar.show()
        onGo: root.goTo(num)

        onBackClicked: GlobalSignals.goHome()
    }

    IpPatentsPage
    {
        id: lt1
        state: root.area === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        website: "https://ip.sandia.gov/category.do/categoryID=21"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt2
        state: root.area === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-2"

        website: "https://ip.sandia.gov/category.do/categoryID=19"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt3
        state: root.area === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-3"

        website: "https://ip.sandia.gov/category.do/categoryID=22"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }


    IpPatentsPage
    {
        id: lt4
        state: root.area === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-4"

        website: "https://ip.sandia.gov/category.do/categoryID=23"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt5
        state: root.area === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-5"

        website: "https://ip.sandia.gov/category.do/categoryID=25"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt6
        state: root.area === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-6"

        website: "https://ip.sandia.gov/category.do/categoryID=26"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt7
        state: root.area === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-7"

        website: "https://ip.sandia.gov/category.do/categoryID=20"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    IpPatentsPage
    {
        id: lt8
        state: root.area === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"
        elementIcon: "lt-8"

        website: "https://ip.sandia.gov/category.do/categoryID=28"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    IpPatentSearch
    {
        id: patents
        state: root.area === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    IpAskExpert
    {
        id: experts
        state: root.area === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    Sidebar
    {
        activeArea: root.area === 0 ? 0 : root.area < 9 ? 1 : root.area-7
        id: sidebar
        buttons: ["Intellectual Property", "Licensible Technologies", "Visual Patent Search", "Lab Experts"]
        onSetArea:
        {
            if (num < 2) {
                root.area = num
            } else {
                root.area = num + 7
            }
        }
    }

    function goTo(num) {
        root.area = num
    }

    function goHome() {
        root.area = 0
    }
}
