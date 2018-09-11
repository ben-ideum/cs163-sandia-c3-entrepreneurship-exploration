import QtQuick 2.0

import "../General"
import ".."

PageDefault
{
    pageTitle: "LICENSING & TECH TRANSFER"
    subTitle: ""
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
            width: 1330

            AppText
            {
                fontPrototype: Style.font_p
                color: Style.cyan
                wrapMode: Text.Wrap
                state: root.state
                delay: 200
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: 160
                font.pixelSize: 50
                text: "Sandia’s intellectual property results primarily from R & D conducted for the government in the national security sector. We collaborate with industry, leveraging each other’s strengths to develop innovative technology. We perform internal R&D directed at the most challenging issues in national security, for which breakthroughs would provide exceptional value to government and industry."
                anchors.top: parent.top
                anchors.topMargin: 584-Style.headerSize - inOutState * 100
            }
        }

        FadeState
        {
            x: 1327
            y: 544-Style.headerSize
            delay: 300
            state: root.state

            Image
            {
                source: contentPath+"tech-transfer/tech-transfer-0.png"
                y: -parent.inOutState * 100
            }
        }

        Row
        {
            x: 1327
            y: 774-Style.headerSize
            spacing: 70

            Repeater
            {
                model: 4

                FadeState
                {
                    delay: 400+index*100
                    state: root.state
                    width: img.width
                    height: img.height

                    Image
                    {
                        id: img
                        source: contentPath+"tech-transfer/tech-transfer-"+(index+1)+".png"
                        x: -parent.inOutState * 100
                    }
                }
            }
        }
    }
}
