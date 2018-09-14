import QtQuick 2.0
import QtWebEngine 1.5

import "../General"

PageDefault
{
    pageTitle: "Connect with a National Lab Expert"
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
            width: 2200
            height: 1280
            anchors.centerIn: parent

            clip: true

            WebEngineView
            {
                id: webview
                url: root.state === "SHOWING" ? "https://www.labpartnering.org/connect_with_experts" : ""
                profile.offTheRecord: true

                anchors.fill: parent

                audioMuted: root.state === "HIDDEN"
            }
        }
    }
}
