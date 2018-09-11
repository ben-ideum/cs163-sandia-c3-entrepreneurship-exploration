import QtQuick 2.0

import "../General"
import ".."

Item {

    readonly property var fields: [landing, crf, detl, nsttf, cint, swift]

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
    }

    function goTo(num) {
        sidebar.activeArea = num
    }

    function goHome() {
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
