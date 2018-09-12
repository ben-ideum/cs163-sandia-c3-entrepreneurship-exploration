import QtQuick 2.0
import QtMultimedia 5.9

import ".."
import "../General"

SectionDefault
{

    id: root

    signal go(int num)

    ListModel
    {
        id: sections
        ListElement { num: 10; icon: "Oh"; txt: "Office Hours" }
        ListElement { num: 11; icon: "E";  txt: "Events" }
        ListElement { num: 12; icon: "Sf"; txt: "Sign-In Form" }
        ListElement { num: 13; icon: "Pr"; txt: "Presentation" }
        ListElement { num: 14; icon: "Wb"; txt: "White Board" }
    }

    SectionBody
    {
        //Image { anchors.fill: parent; source: "../../assets/background.png" }
        Video
        {
            width: parent.width
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            fillMode: VideoOutput.PreserveAspectCrop
            source: "../../videos/Background_video_loop.mov"
            loops: MediaPlayer.Infinite
            autoPlay: true
        }

        AppText
        {
            id: headerText_1
            text: "C3"
            x: 268
            font.pixelSize: 170 * 2 / 3
            anchors.verticalCenter: parent.top
            anchors.verticalCenterOffset: contentHeight * 1.5 - 100 * inOutState
            state: root.state
        }

        AppText
        {
            text: "Stimulating Innovation, Cultivating Entrepreneurs, and Generating Jobs"
            font.pixelSize: headerText_1.font.pixelSize * 2 / 3
            x: headerText_1.x
            anchors.top: headerText_1.bottom
            anchors.topMargin: -100 * inOutState
            delay: 300
            state: root.state
        }

        Row
        {
            spacing: (parent.width - height * 5) / 6
            height: parent.height / 3.2
            x: spacing
            anchors.verticalCenter: parent.verticalCenter

            Repeater
            {
                model: sections

                Item
                {
                    height: parent.height
                    width: height

                    ElementIcon
                    {
                        state: root.state
                        height: parent.height
                        width: height

                        anchors.centerIn: parent
                        anchors.horizontalCenterOffset: -inOutState * height * 0.2
                        delay: index * 100

                        number: num
                        mainText: icon
                        subText: txt

                        onClicked: root.go(num)
                    }
                }
            }
        }
    }
}
