import QtQuick 2.0

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
    }
}

