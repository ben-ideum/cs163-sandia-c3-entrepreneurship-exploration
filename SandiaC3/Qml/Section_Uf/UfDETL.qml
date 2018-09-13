import QtQuick 2.0

import "../General"
import ".."

UfPopupScreen
{
    id: root

    referenceArea: box

    line_start: marker_loc
    line_size: Qt.vector2d(box.x-marker_loc.x,2)
    tour_loc: Qt.vector2d(-10000000,-10000000) // it's way out there

    Item {
        id: box
        anchors.fill: root
        anchors.topMargin: 100
        anchors.bottomMargin: 100
        anchors.rightMargin: 50
        anchors.leftMargin: 1670

        FadeState
        {
            id: img_fade
            state: root.state
            delay: 800
        }

        Image {
            source: "../../assets/uf/detl-image.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 50
            anchors.right: parent.right
            anchors.rightMargin: 100
            opacity: img_fade.opacity
        }

        AppText
        {
            text: "Distributed Energy Technologies Laboratory (DETL)"
            state: root.state
            x: 100
            anchors.top: parent.top
            anchors.topMargin: 120 * inOutToShow
            delay: 800
            duration: 200
            font.pixelSize: 80
        }

        AppText
        {
            text: "DETL conducts research to integrate emerging energy technologies into new and existing electricity infrastructures. A designated user facility, staff work sideby-side with partners to conduct investigations and explore new systems approaches to electric grid issues. These partnerships span the spectrum of utilities, manufacturers, system integrators, universities, state energy offices, other national laboratories and defense institutions, and even international collaborators. The Photovoltaic Systems Evaluation Laboratory (PSEL) is a multi-user, multi-sponsor facility that conducts research in PV cells, modules, and arrays and performs detailed, comprehensive analysis in PV systems design, optimization, and characterization in real-world scenarios."
            state: root.state
            x: 100
            anchors.top: parent.top
            anchors.topMargin: 260 - font.pixelSize * inOutState
            delay: 1000
            duration: 200
            width: parent.width * 0.4
            wrapMode: Text.Wrap
            fontPrototype: Style.font_p
            font.pixelSize: 36
            lineHeight: 1.1
        }
    }

}
