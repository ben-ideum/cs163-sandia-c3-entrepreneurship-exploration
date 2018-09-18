import QtQuick 2.0
import QtWebEngine 1.5

import "../General"
import ".."

PageDefault
{
    property string elementIcon: "lt-1"
    property string website: ""
    property bool reload: false

    pageTitle: "INTELLECTUAL PROPERTY"
    subTitle: ""
    icon_name: "lt-icon"

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
            id: bg
            anchors.fill: page
            anchors.leftMargin: block_area.width
            color: "white"
            opacity: 0.2
        }

        AppText
        {
            color: Style.gray
            font.pixelSize: parent.height / 14
            text: "Loading..."
            font.capitalization: Font.SmallCaps
            anchors.centerIn: bg
        }

        FadeState
        {
            x: 281
            y: 401-Style.headerSize
            state: root.state
            delay: 200

            Image {
                source: "../../assets/ip/"+root.elementIcon+".png"
                y: parent.inOutState * -100

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        root.reload = true
                        reload_timer.start()
                    }
                }

                Timer
                {
                    id: reload_timer
                    interval: 200
                    onTriggered: root.reload = false
                }
            }
        }

        Item
        {
            id: page
            width: 2000
            height: 1280
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: -block_area.width/2

            clip: true

            WebEngineView
            {
                id: webview
                url: root.state === "SHOWING" && !root.reload ? root.website : ""
                profile.offTheRecord: true

                anchors.fill: parent

                audioMuted: root.state === "HIDDEN"
                zoomFactor: 2
            }

            MouseArea
            {
                id: block_area
                height: parent.height
                width: 400

                Rectangle
                {
                    anchors.fill: parent
                    color: Style.gray
                }
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
            anchors.verticalCenter: page.top
            anchors.horizontalCenter: page.right

            MouseArea
            {
                anchors.fill: parent
                anchors.margins: -parent.height/4
                onClicked: root.homeClicked()
            }
        }
    }
}
