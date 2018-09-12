import QtQuick 2.0

import "../General"
import ".."

PageDefault
{
    pageTitle: "INTELLECTUAL PROPERTY"
    subTitle: ""
    icon_name: "ip-icon"

    id: root

    signal go(int num)

    PageBody
    {
        state: root.state

        Rectangle
        {
            anchors.fill: parent
            color: "white"
        }

        AppText
        {
            fontPrototype: Style.font_p_book
            color: "black"
            wrapMode: Text.Wrap
            state: root.state
            delay: 200
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 130
            font.pixelSize: 50
            text: "Locate technologies developed with DOE funding and available for licensing. These technologies can be viewed as marketing summaries, which provide business friendly descriptions of the technology, or the patent itself. When you find a technology you are interested in, please contact Sandia’s IP office."
            anchors.top: parent.top
            anchors.topMargin: 60 - inOutState * 100
            lineHeight: 1.1
        }

        AppText
        {
            fontPrototype: Style.font_p
            color: Style.cyan
            state: root.state
            delay: 250
            anchors.left: parent.left
            anchors.margins: 130
            font.pixelSize: 60
            text: "Licensible Technologies"
            anchors.top: parent.top
            anchors.topMargin: 300 - inOutState * 100
        }

        Row
        {
            x: 81
            y: 903 - Style.headerSize
            spacing: 40

            Repeater
            {
                model: 4

                FadeState
                {
                    state: root.state
                    delay: 200 + 100 * index

                    width: img.width
                    height: img.height

                    Image {
                        id: img
                        source: "../../assets/ip/lt-"+(index+1)+".png"
                        y: -parent.inOutState * 100
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: root.go(index+1)
                    }
                }
            }
        }


        Row
        {
            x: 81
            y: 1330 - Style.headerSize
            spacing: 40

            Repeater
            {
                model: 4

                FadeState
                {
                    state: root.state
                    width: img1.width
                    height: img1.height
                    delay: 200 + 100 * (index + 4)

                    Image {
                        id: img1
                        source: "../../assets/ip/lt-"+(index+5)+".png"
                        y: -parent.inOutState * 100
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: root.go(index+5)
                    }
                }

            }
        }

        AppText
        {
            fontPrototype: Style.font_p
            color: Style.cyan
            state: root.state
            delay: 900
            anchors.left: parent.left
            anchors.margins: 1994
            font.pixelSize: 60
            text: "Visual Patent Search"
            anchors.top: parent.top
            anchors.topMargin: 450 - inOutState * 100
        }

        FadeState
        {
            x: 1862
            y: 1045-Style.headerSize
            state: root.state
            delay: 1000

            Image {
                source: "../../assets/ip/ip-patent-search.png"
                y: parent.inOutState * -100
            }
        }

        AppText
        {
            fontPrototype: Style.font_p
            color: Style.cyan
            state: root.state
            delay: 1100
            anchors.left: parent.left
            anchors.margins: 3049
            font.pixelSize: 60
            text: "Connect with a<br>National Lab Expert"
            horizontalAlignment: Text.AlignHCenter
            anchors.top: parent.top
            anchors.topMargin: 430 - inOutState * 100
            lineHeight: 1.1
        }

        FadeState
        {
            x: 2978
            y: 1123-Style.headerSize
            state: root.state
            delay: 1200

            Image {
                source: "../../assets/ip/ip-connect-expert.png"
                y: parent.inOutState * -100
            }
        }
    }
}

