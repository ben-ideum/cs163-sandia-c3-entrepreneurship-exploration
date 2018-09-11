import QtQuick 2.0

import "../General"
import ".."

UfPopupScreen
{
    readonly property string tourName: "The Scaled Wind Farm Technology (SWiFT) Facility"

    id: root

    referenceArea: box

    line_start: Qt.vector2d(box.x+box.width,marker_loc.y)
    line_size: Qt.vector2d(marker_loc.x-line_start.x,2)
    tour_loc: Qt.vector2d(box.width/4, box.height-100)

    Item {
        id: box
        anchors.fill: root
        anchors.topMargin: 100
        anchors.bottomMargin: 100
        anchors.rightMargin: 540
        anchors.leftMargin: 1167

        FadeState
        {
            id: img_fade
            state: root.state
            delay: 800
        }

        Image {
            id: img
            source: "../../assets/uf/swift-image.png"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 100
            anchors.right: parent.right
            anchors.rightMargin: 60
            opacity: img_fade.opacity
        }

        AppText
        {
            text: "The Scaled Wind Farm Technology (SWiFT) Facility"
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
            text: "SWiFT performs accredited research testing for both collaborative and highly proprietary projects with industrial, governmental, and academic partners. A collaboration between Sandia, Vestas, Texas Tech Univ. National Wind Institute at Reese Technology Center and Group NIRE."
            state: root.state
            x: 100
            anchors.top: img.top
            anchors.topMargin: -font.pixelSize * inOutState
            delay: 1000
            duration: 200
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.right: img.left
            anchors.rightMargin: 20
            wrapMode: Text.Wrap
            fontPrototype: Style.font_p
            font.pixelSize: 44
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
