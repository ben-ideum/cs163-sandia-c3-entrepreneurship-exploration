import QtQuick 2.0

import "../General"
import ".."

UfPopupScreen
{
    readonly property string tourName: "The National Solar Thermal Test Facility (NSTTF)"

    id: root

    referenceArea: box

    line_start: Qt.vector2d(box.x+box.width,marker_loc.y)
    line_size: Qt.vector2d(marker_loc.x-line_start.x,2)
    tour_loc: Qt.vector2d(box.width/5, box.height-100)

    Item {
        id: box
        anchors.fill: root
        anchors.topMargin: 100
        anchors.bottomMargin: 100
        anchors.rightMargin: 1600
        anchors.leftMargin: 100

        FadeState
        {
            id: img_fade
            state: root.state
            delay: 800
        }

        Image {
            id: img
            source: "../../assets/uf/nsttf-image.png"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 140
            anchors.right: parent.right
            anchors.rightMargin: 120
            opacity: img_fade.opacity
        }

        AppText
        {
            text: "The National Solar Thermal Test Facility (NSTTF)"
            state: root.state
            x: 100
            anchors.top: parent.top
            anchors.topMargin: 40 * inOutToShow
            delay: 800
            duration: 200
            font.pixelSize: 80
        }

        AppText
        {
            text: "Provides experimental engineering data for the design, construction, and operation of unique components and systems in proposed solar thermal electrical plants planned for large-scale power generation."
            state: root.state
            x: 100
            anchors.top: img.top
            anchors.topMargin: -font.pixelSize * inOutState
            delay: 1000
            duration: 200
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.right: img.left
            anchors.rightMargin: 40
            wrapMode: Text.Wrap
            fontPrototype: Style.font_p
            font.pixelSize: 48
            lineHeight: 1.1
        }
    }

    UfTourPage
    {
        id: tour
    }

    onGoTour: tour.state = "SHOWING"
    onStopTour: tour.state = "HIDDEN"
}
