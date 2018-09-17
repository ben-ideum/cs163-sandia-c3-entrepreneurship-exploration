import QtQuick 2.0

import "../General"
import ".."

PageBody {
    property UfTourPage tourPage: null

    property vector2d marker_loc: Qt.vector2d(0,0)

    property vector2d line_start: Qt.vector2d(1,1)
    property vector2d line_size: Qt.vector2d(2,0)
    property vector2d tour_loc: Qt.vector2(50,50)

    property Item referenceArea: Item {}

    id: root

    signal close()
    signal goTour()
    signal stopTour()

    FadeState
    {
        id: fade_in
        state: root.state
        delay: 100
        duration: 100
    }

    FadeState
    {
        id: fade_line
        state: root.state
        delay: 200
        duration: 200
    }

    FadeState
    {
        id: fade_rect
        state: root.state
        delay: 400
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: root.close()
    }

    Rectangle
    {
        id: tie_line
        color: Style.cyan
        x: root.line_start.x + 2
        y: root.line_start.y-pointer.height*2/3 + 2
        width: root.line_size.x * fade_line.inOutToShow
        height: root.line_size.y * fade_line.inOutToShow
    }

    Rectangle
    {
        color: Style.cyan
        radius: 8
        height: 16 * fade_line.inOutToShow; width: height
        x: root.marker_loc.x + 2 - width/2
        y: root.marker_loc.y - pointer.height * 2 / 3 + 2 - height/2
    }

    Image {
        id: pointer
        source: "../../assets/marker.png"
        x: marker_loc.x - width/2
        y: marker_loc.y - height
        transform: Scale { yScale: fade_in.inOutToShow; origin.x: pointer.width/2; origin.y: pointer.height }
    }

    Rectangle
    {
        id: box
        color: Style.cyan
        radius: 30
        anchors.centerIn: referenceArea
        width: referenceArea.width
        height: referenceArea.height
        opacity: 0.8 * fade_rect.inOutToShow
        anchors.horizontalCenterOffset: -fade_rect.inOutState * 100
    }

    Item
    {
        anchors.fill: box
        opacity: fade_rect.inOutToShow


        Image {
            source: "../../assets/uf/3d-tour-button.png"
            x: root.tour_loc.x-width/2
            y: root.tour_loc.y-height/2

            MouseArea
            {
                anchors.fill: parent
                onClicked: root.goTour()
            }
        }

        Image
        {
            source: "../../assets/close-button.png"
            anchors.verticalCenter: parent.top
            anchors.verticalCenterOffset: height
            anchors.horizontalCenter: parent.right
            anchors.horizontalCenterOffset: -height

            MouseArea
            {
                anchors.fill: parent
                anchors.margins: -parent.height/4
                onClicked: root.close()
            }
        }
    }
}
