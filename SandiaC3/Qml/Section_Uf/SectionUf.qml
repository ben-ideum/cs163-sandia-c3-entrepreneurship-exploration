import QtQuick 2.0

import "../General"
import ".."

FadeState {

    readonly property var fields: [landing, crf, cint, detl, nsttf, swift]

    id: root

    anchors.fill: parent

    UfLanding
    {
        id: landing
        state: "SHOWING"
        bubbleState: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onMenuClicked: sidebar.show()
        onGo: root.goTo(num)
        onBackClicked: root.goBack()
        onHomeClicked: root.goHome()
    }

    UfCRF
    {
        id: crf
        marker_loc: landing.crf_loc
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onClose: root.goHome()
        onGoTour: landing.pageTitle = tourName
        onStopTour: landing.pageTitle = "USER FACILITIES"
    }

    UfDETL
    {
        id: detl
        marker_loc: landing.detl_loc
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onClose: root.goHome()
    }

    UfNSTTF
    {
        id: nsttf
        marker_loc: landing.nsttf_loc
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onClose: root.goHome()
        onGoTour: landing.pageTitle = tourName
        onStopTour: landing.pageTitle = "USER FACILITIES"
    }

    UfCINT
    {
        id: cint
        marker_loc: landing.cint_loc
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onClose: root.goHome()
        onGoTour: landing.pageTitle = tourName
        onStopTour: landing.pageTitle = "USER FACILITIES"
    }

    UfSWiFT
    {
        id: swift
        marker_loc: landing.swift_loc
        state: sidebar.activeArea === root.fields.indexOf(this) ? "SHOWING" : "HIDDEN"

        onClose: root.goHome()
        onGoTour: landing.pageTitle = tourName
        onStopTour: landing.pageTitle = "USER FACILITIES"
    }

    Sidebar
    {
        id: sidebar
        buttons: ["SNL Map", "CRF", "CINT", "DETL", "NSTTF", "SWiFT"]

        onSetArea: root.goTo(num)
    }

    function goTo(num) {
        sidebar.activeArea = num
    }

    function goTour(num) {
        sidebar.activeArea = num
        if (num !== 0) {
            fields[sidebar.activeArea].goTour()
        }
    }

    function goHome() {
        if (sidebar.activeArea !== 0) {
            root.fields[sidebar.activeArea].stopTour()
        }
        sidebar.activeArea = 0
    }

    function goBack() {
        if (sidebar.activeArea == 0) {
            state = "HIDDEN"
        } else {
            if (root.fields[sidebar.activeArea].tour_active) {
                root.fields[sidebar.activeArea].stopTour();
            } else {
                root.goTo(0)
            }
        }
    }
}
