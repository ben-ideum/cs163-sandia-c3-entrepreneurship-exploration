import QtQuick 2.0

import "../General"

PageDefault
{
    pageTitle: "FEDERAL LAB CONSORTIUM AWARDS"
    icon_name: "p-icon"

    id: root

    PageBody
    {
        clip: true
        state: root.state

        Image
        {
            height: parent.height
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            fillMode: Image.PreserveAspectCrop
            source: "../../assets/p/consortium-awards-background.png"
        }

        Rectangle
        {
            anchors.fill: parent
            color: "black"
            opacity: 0.3
        }

        Row
        {
            x: 256
            y: 60
            spacing: 120

            FadeState
            {
                width: img1.width
                height: img1.height
                state: root.state
                delay: 200

                Image {
                    id: img1
                    source: appContent+"/consortium-awards/consortium-awards-1.png"
                    x: parent.inOutState * 100
                }
            }

            FadeState
            {
                width: img2.width
                height: img2.height
                state: root.state
                delay: 400

                Image {
                    id: img2
                    source: appContent+"/consortium-awards/consortium-awards-2.png"
                    x: parent.inOutState * 100
                }
            }
        }
    }
}
