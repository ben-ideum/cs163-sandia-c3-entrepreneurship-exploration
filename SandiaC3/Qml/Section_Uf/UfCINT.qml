import QtQuick 2.0

import "../General"
import ".."

UfPopupScreen
{
    readonly property string tourName: "The Center for Integrated Nanotechnologies (CINT)"

    id: root

    referenceArea: box

    line_start: Qt.vector2d(box.x+box.width, marker_loc.y)
    line_size: Qt.vector2d(marker_loc.x-line_start.x,2)
    tour_loc: Qt.vector2d(box.width/5, box.height-100)

    Item {
        id: box
        anchors.fill: root
        anchors.topMargin: 50
        anchors.bottomMargin: 100
        anchors.rightMargin: 1525
        anchors.leftMargin: 100

        FadeState
        {
            id: img_fade
            state: root.state
            delay: 800
        }

        Image {
            id: img
            source: "../../assets/uf/cint-image.png"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            anchors.right: parent.right
            anchors.rightMargin: 200
            opacity: img_fade.opacity
        }

        AppText
        {
            text: "The Center for Integrated Nanotechnologies (CINT)"
            state: root.state
            x: 100
            anchors.top: parent.top
            anchors.topMargin: 60 * inOutToShow
            delay: 800
            duration: 200
            font.pixelSize: 80
        }

        AppText
        {
            text: "A National User Facility for Nanoscience Research"
            state: root.state
            anchors.top: img.top
            anchors.topMargin: font.pixelSize * inOutState
            delay: 900
            duration: 200
            anchors.left: parent.left
            anchors.right: img.left
            anchors.leftMargin: 100
            anchors.rightMargin: 50
            wrapMode: Text.Wrap
            fontPrototype: Style.font_p_bold
            font.pixelSize: 40
            lineHeight: 1.1
        }

        AppText
        {
            text: "A DOE Office of Science user facility that has unique world-class research capabilities and technologies which are available broadly to science community worldwide from universities, industry, private laboratories, and other Federal laboratories."
            state: root.state
            anchors.left: parent.left
            anchors.right: img.left
            anchors.leftMargin: 100
            anchors.rightMargin: 50

            anchors.top: parent.top
            anchors.topMargin: 420 - font.pixelSize * inOutState
            delay: 1000
            duration: 200
            wrapMode: Text.Wrap
            fontPrototype: Style.font_p
            font.pixelSize: 40
            lineHeight: 1.1
        }
    }


    UfTourPage
    {
        address: "tours.sandia.gov/CINT/"
        id: tour
        textSource: "../../assets/cint-text.png"

        onCloseItUpTheTour: root.stopTour()
    }

    onGoTour: tour.state = "SHOWING"
    onStopTour: tour.state = "HIDDEN"
}
