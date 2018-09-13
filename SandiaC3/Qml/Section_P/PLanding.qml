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
        id: sections_horiz
        ListElement { num: 8; icon: "Tp"; txt: "Tech Partnerships" }
        ListElement { num: 21; icon: "Ps";  txt: "Prospective Suppliers" }
        ListElement { num: 24; icon: "A"; txt: "Agreements" }
        ListElement { num: 27; icon: "Tt"; txt: "Licensing & Tech Transfer" }
    }

    ListModel
    {
        id: sections_vert
        ListElement { num: 9; icon: "Ss"; txt: "Success Stories" }
        ListElement { num: 22; icon: "Rd";  txt: "R&D100 Awards" }
        ListElement { num: 25; icon: "Fl"; txt: "Federal Lab Consortium Awards" }
    }

    SectionBody
    {
//        Image { anchors.fill: parent; source: "../../assets/background.png" }
        Video
        {
            width: parent.width
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            fillMode: VideoOutput.PreserveAspectCrop
            source: "../../videos/Background_video_loop.mp4"
            loops: MediaPlayer.Infinite
            autoPlay: true
        }

        AppText
        {
            id: headerText_1
            text: "PARTNERSHIP TOOLS"
            x: 170
            font.pixelSize: 170 * 2 / 3
            anchors.top: parent.top
            anchors.topMargin: 800 - Style.sectionHeaderSize
            state: root.state
        }

        Row
        {
            spacing: 70
            height: parent.height / 3.4
            x: 170
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: 80

            Repeater
            {
                model: sections_horiz

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

                        onClicked: root.go(index+1)
                    }
                }
            }
        }

        Column
        {
            spacing: 30
            width: parent.height / 3.4
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.right
            anchors.horizontalCenterOffset: -width

            Repeater
            {
                model: sections_vert

                Item
                {
                    height: parent.width
                    width: height

                    ElementIcon
                    {
                        state: root.state
                        height: parent.width
                        width: height

                        anchors.centerIn: parent
                        anchors.horizontalCenterOffset: -inOutState * height * 0.2
                        delay: (index+4) * 100

                        number: num
                        mainText: icon
                        subText: txt

                        onClicked: root.go(index+5)
                    }
                }
            }
        }
    }
}
