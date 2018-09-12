import QtQuick 2.0

import "../General"
import ".."

UfPopupScreen
{
    readonly property bool tour_active: tour.state === "SHOWING"
    readonly property string tourName: "The Combustion Research Facility (CRF)"

    id: crf

    referenceArea: box

    line_start: marker_loc
    line_size: Qt.vector2d(box.x-marker_loc.x,2)
    tour_loc: Qt.vector2d(box.width/3, box.height-100)

    Item {
        id: box
        anchors.fill: crf
        anchors.topMargin: 100
        anchors.bottomMargin: 100
        anchors.rightMargin: 200
        anchors.leftMargin: 1300

        FadeState
        {
            id: img_fade
            state: crf.state
            delay: 800
        }

        Image {
            source: "../../assets/uf/crf-images.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 100
            opacity: img_fade.opacity
        }

        AppText
        {
            text: "Combustion Research Facility (CRF)"
            state: crf.state
            x: 100
            anchors.top: parent.top
            anchors.topMargin: 60 * inOutToShow
            delay: 800
            duration: 200
            font.pixelSize: 80
        }

        AppText
        {
            text: "Creating the Science of Clean, Low-Carbon Transportation"
            state: crf.state
            x: 100
            anchors.top: parent.top
            anchors.topMargin: 180 - font.pixelSize * inOutState
            delay: 900
            duration: 200
            width: parent.width/2
            wrapMode: Text.Wrap
            fontPrototype: Style.font_p_bold
            font.pixelSize: 40
            lineHeight: 1.1
        }

        AppText
        {
            text: "The CRF is, an international leader in developing cleaner, more efficient transportation since its creation by the Department of Energy (DOE) more than 35 years ago. This collaborative research facility has been instrumental in helping the automotive and trucking industries improve their products. As one industry leader has stated, nearly every vehicle on the road today is cleaner and more efficient because of work at the CRF."
            state: crf.state
            x: 100
            anchors.top: parent.top
            anchors.topMargin: 320 - font.pixelSize * inOutState
            delay: 1000
            duration: 200
            width: parent.width * 0.4
            wrapMode: Text.Wrap
            fontPrototype: Style.font_p
            font.pixelSize: 40
            lineHeight: 1.1
        }
    }

    UfTourPage
    {
        address: "tours.sandia.gov/CRF/"
        id: tour
        tourText: "As an Office of Science collaborative research facility, a key aspect of the CRFs mission is to encourage the direct involvement of individuals, or “collaborators,” from the scientific community. Located in Livermore, California the CRF hosts more than 100 collaborators each year, who work side-by-side with staff researchers to develop new research methods and approaches, conduct experiments exploiting new facilities and techniques, and solve high-priority combustion problems.

The CRF emphasizes collaborative investigations that lead to openly published results, but other models for supporting proprietary research can be arranged."
    }

    onGoTour: tour.state = "SHOWING"
    onStopTour: tour.state = "HIDDEN"
}
