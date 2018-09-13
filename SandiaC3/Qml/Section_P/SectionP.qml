import QtQuick 2.0

import "../General"
import ".."

FadeState {

    readonly property var fields: [landing, partnerships, suppliers, agreements, licensing, successes, rd100, consortium]

    id: root

    anchors.fill: parent

    PLanding
    {
        id: landing
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onGo: root.goTo(num)
    }

    PTechnologyPartnerships
    {
        id: partnerships
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    PProspectiveSuppliers
    {
        id: suppliers
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    PAgreements
    {
        id: agreements
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    PLicensingTechTransfer
    {
        id: licensing
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    PSuccessStories
    {
        id: successes
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    PRD100
    {
        id: rd100
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    PConsortiumAwards
    {
        id: consortium
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onHomeClicked: root.goHome()
    }

    PageBody
    {
        state: sidebar.activeArea > 0 && sidebar.activeArea < 5 ? "SHOWING" : "HIDDEN"

        Carousel
        {
            activePage: sidebar.activeArea - 1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 70

            onGoNext: root.goTo(1 + ((activePage + 1) % 4))
            onGoPrevious:
            {
                var tmp = activePage -1;
                if (tmp < 0) { tmp += 4 }
                root.goTo(1+tmp)
            }
            onGoTo: root.goTo(1+num)
        }
    }

    Sidebar
    {
        id: sidebar
        buttons: ["Partnership Home", "Tech Partnerships", "Prospective Suppliers", "Agreements", "Licensing & Tech Transfer", "Success Stories", "RD100 Awards", "FLC Awards"]

        onSetArea: root.goTo(num)
    }


    function goTo(num) {
        sidebar.activeArea = num
    }

    function goHome() {
        sidebar.activeArea = 0
    }
}
