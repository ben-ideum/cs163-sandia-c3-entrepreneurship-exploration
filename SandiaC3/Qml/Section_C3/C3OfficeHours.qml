import QtQuick 2.0

import "../General"

PageDefault
{
    pageTitle: "C3 OFFICE HOURS"

    id: root

    PageBody
    {
        clip: true

        Rectangle
        {
            anchors.fill: parent
            color: "white"
        }

        Image
        {
            width: parent.width
            anchors.bottom: parent.bottom
            fillMode: Image.PreserveAspectFit
            source: "../../assets/office-hours-background.png"
        }

        AppText
        {
            id: headerText_1
            text: "Open to the public<br>Monday-Friday<br>9:00 a.m.- 4:00 p.m."
            color: "black"
            horizontalAlignment: Text.AlignHCenter

            state: root.state
            delay: 200

            font.pixelSize: 170 * 2 / 3
            lineHeight: 1.3
            anchors.topMargin: font.pixelSize * 2 * (1.0 - inOutState)
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
