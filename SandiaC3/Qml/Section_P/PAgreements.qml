import QtQuick 2.0
import QtWebEngine 1.5

import "../General"
import ".."

PageDefault
{
    pageTitle: "AGREEMENTS"
    subTitle: ""
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
            anchors.right: parent.right
            color: "white"
            width: 1300

            AppText
            {
                fontPrototype: Style.font_p
                color: "black"
                state: root.state
                delay: 1000
                anchors.left: parent.left
                anchors.leftMargin: 200
                font.pixelSize: 50
                text: "Places to Partner"
                anchors.top: parent.top
                anchors.topMargin: 60 - inOutState * 100
            }

            FadeState
            {
                x: 200
                y: 660-Style.headerSize
                state: root.state
                delay: 1100

                Image
                {
                    source: "../../assets/p/agreements-6.png"
                    y: -parent.inOutState * 100


                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: video_player.state = "SHOWING"
                    }
                }
            }

            FadeState
            {
                x: 200
                y: 1250-Style.headerSize
                state: root.state
                delay: 1200

                Image
                {
                    source: "../../assets/p/agreements-7.png"
                    y: -parent.inOutState * 100
                }
            }
        }

        AppText
        {
            fontPrototype: Style.font_p
            color: "black"
            state: root.state
            delay: 200
            anchors.left: parent.left
            anchors.leftMargin: 101
            font.pixelSize: 50
            text: "Partnership Agreement Types"
            anchors.top: parent.top
            anchors.topMargin: 60 - inOutState * 100
        }

        ListModel
        {
            id: agreements_model
            ListElement { px: 101; py: 683 }
            ListElement { px: 900; py: 683 }
            ListElement { px: 101; py: 1173 }
            ListElement { px: 900; py: 1173 }
            ListElement { px: 1701; py: 813 }
        }

        Repeater
        {
            model: agreements_model

            FadeState
            {
                state: root.state
                x: model.px
                y: model.py-Style.headerSize

                delay: 300 + 100 * index

                Image {
                    source: "../../assets/p/agreements-"+(index+1)+".png"
                    y: -parent.inOutState * 100
                }
            }
        }

        FadeState
        {
            id: video_player
            anchors.fill: parent

            Rectangle
            {
                anchors.fill: parent
                color: "white"
                opacity: 0.9
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: video_player.state = "HIDDEN"
            }

            Rectangle
            {
                anchors.fill: video_frame
                color: "black"
                opacity: 0.3
                anchors.margins: -10

                AppText
                {
                    color: "black"
                    font.pixelSize: parent.height / 14
                    text: "Loading..."
                    font.capitalization: Font.SmallCaps
                    anchors.centerIn: parent
                }
            }

            Item
            {
                id: video_frame
                width: 1920
                height: 1000

                anchors.centerIn: parent

                clip: true

                WebEngineView
                {
                    url: video_player.state === "SHOWING" ? "https://www.youtube.com/embed/5pVjCJDAyhk" : ""
                    profile.offTheRecord: true

                    width: parent.width
                    height: parent.height
                    anchors.centerIn: parent

                    audioMuted: video_player.state === "HIDDEN"
                }
            }


            Rectangle
            {
                anchors.fill: close_btn
                anchors.margins: -2
                color: "black"
                radius: height/2
            }

            Image {
                id: close_btn
                source: "../../assets/close-button.png"
                anchors.verticalCenter: video_frame.top
                anchors.horizontalCenter: video_frame.right

                MouseArea
                {
                    anchors.fill: parent
                    anchors.margins: -parent.height/4
                    onClicked: video_player.state = "HIDDEN"
                }
            }
        }

        onHidden: video_player.state = "HIDDEN"
    }
}

