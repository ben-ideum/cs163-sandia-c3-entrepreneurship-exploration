import QtQuick 2.0

import "../General"
import ".."

PageDefault
{
    pageTitle: "PROSPECTIVE SUPPLIERS"
    subTitle: "Sandia spends about $1 billion/year on purchases of quality products and services to meet its national security missions"
    icon_name: "p-icon"

    id: root

    PageBody
    {
        state: root.state

        Rectangle
        {
            anchors.fill: parent
            color: "white"
        }

        Item
        {
            id: white
            height: parent.height
            width: 840

            AppText
            {
                fontPrototype: Style.font_p
                color: Style.cyan
                wrapMode: Text.Wrap
                state: root.state
                delay: 200
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 60
                font.pixelSize: 50
                text: "The Labs are committed to buying from small businesses and partnering with companies that share its values of conducting business in an ethical and safe manner while providing products and services on time and within budget."
                anchors.top: parent.top
                anchors.topMargin: 200 - inOutState * 100
            }
        }

        FadeState
        {
            state: root.state
            x: 886
            y: 50
            delay: 400

            Image {
                source: "../../assets/p/prospective-suppliers-1.png"
                x: -parent.inOutState * 100
            }
        }

        FadeState
        {
            state: root.state
            x: 1812
            y: 22
            delay: 800

            Image {
                source: appContent+"/suppliers/prospective-suppliers-2.png"
                x: -parent.inOutState * 100
            }
        }
    }
}
