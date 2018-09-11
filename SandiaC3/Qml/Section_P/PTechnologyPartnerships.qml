import QtQuick 2.0

import "../General"
import ".."

PageDefault
{
    pageTitle: "TECHNOLOGY PARTNERSHIPS"
    subTitle: "Allowing community members to leverage Sandia's resources"
    icon_name: "p-icon"

    id: root

    PageBody
    {
        state: root.state

        Rectangle
        {
            anchors.fill: parent
            color: Style.gray
        }

        Rectangle
        {
            id: white
            height: parent.height
            width: 1240

            AppText
            {
                fontPrototype: Style.font_p
                color: Style.cyan
                wrapMode: Text.Wrap
                state: root.state
                delay: 200
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 134
                font.pixelSize: 54
                text: "Collaborations with industry, small businesses, universities, and government agencies on emerging technologies support Sandia’s primary mission for the U.S. Department of Energy/National Nuclear Security Administration and bring new technologies to the marketplace."
                anchors.top: parent.top
                anchors.topMargin: 200 - inOutState * 100
            }
        }

        Row
        {
            spacing: 70
            y: 554-Style.headerSize
            x: 1321

            Repeater
            {
                model: 3

                FadeState
                {
                    width: img.width
                    height: img.height
                    state: root.state
                    delay: index*150

                    Image
                    {
                        id: img
                        source: "../../assets/p/tech-partner-"+index+".png"
                        x: -150 * parent.inOutState
                    }
                }
            }
        }

    }
}
