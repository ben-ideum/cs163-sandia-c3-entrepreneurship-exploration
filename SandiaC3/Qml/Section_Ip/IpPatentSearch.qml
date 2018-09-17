import QtQuick 2.0
import QtWebEngine 1.5

import "../General"

PageDefault
{
    pageTitle: "Visual Patent Search"
    icon_name: "ip-icon"

    id: root

    PageBody
    {
        state: root.state

        Rectangle
        {
            anchors.fill: page
            color: "white"
            opacity: 0.2
        }

        AppText
        {
            color: "black"
            font.pixelSize: parent.height / 14
            text: "Loading..."
            font.capitalization: Font.SmallCaps
            anchors.centerIn: page
        }

        Item
        {
            id: page
            width: 2500
            height: 1280
            anchors.centerIn: parent

            clip: true

            WebEngineView
            {
                id: webview
                url: root.state === "SHOWING" ? "https://vps.labworks.org/" : ""
                profile.offTheRecord: true

                anchors.fill: parent

                audioMuted: root.state === "HIDDEN"
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

    onHidden: webview.reload()
}
