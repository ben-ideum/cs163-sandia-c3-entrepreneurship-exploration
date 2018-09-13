import QtQuick 2.0

import "../General"
import ".."

PageDefault
{
    property int activeVideo: -1

    pageTitle: ""
    icon_name: "p-icon"

    id: root

    signal showVideo(int num)

    PageHeader
    {
        Image
        {
            id: rd_icon
            source: "../../assets/p/rd-100-icon.png"
            x: 302
            y: 88
        }

        AppText
        {
            fontPrototype: Style.font_p
            font.pixelSize: 70
            text: "Honoring great R&D pioneers and their revolutionary<br>ideas in science and technology"
            anchors.left: rd_icon.right
            anchors.leftMargin: 60
            anchors.verticalCenter: rd_icon.verticalCenter
            lineHeight: 1.1
        }
    }

    PageBody
    {
        clip: true
        state: root.state

        Rectangle
        {
            anchors.fill: parent
            color: "white"
        }

        Row
        {
            x: 100
            y: 120
            spacing: 50

            Repeater
            {
                model: 5

                FadeState
                {
                    width: img1.width
                    height: img1.height
                    state: root.state
                    delay: 200 + 100 * index

                    Image {
                        id: img1
                        source: "../../assets/p/rd-100-"+(index+1)+".png"
                        x: parent.inOutState * 100

                        MouseArea
                        {
                            anchors.fill: parent
                            onClicked: root.showVideo(index)
                        }
                    }
                }
            }
        }

        Rectangle
        {
            anchors.fill: parent
            color: "white"
            opacity: root.activeVideo === -1 ? 0 : 0.6
            Behavior on opacity { NumberAnimation { duration: 500 } }

            MouseArea
            {
                anchors.fill: parent
                enabled: parent.opacity > 0
                onClicked: root.showVideo(-1)
            }
        }

        Repeater
        {
            model: [
                "RD100_SGHAT 2013",
                "RD100_UWBG_RandD100_4_21_1",
                "RD100_ControlSystemActiveDampening",
                "RD100_SolidSenseGas Analyzer",
                "RD100_Microgrid Toolkit"
            ]

            PRD100VideoPlayer
            {
                anchors.centerIn: parent
                videoName: modelData
                state: root.activeVideo == index ? "SHOWING" : "HIDDEN"

                onDone: root.showVideo(-1)
            }
        }
    }

    onShowVideo: root.activeVideo = num

    onHidden: root.showVideo(-1)
}
