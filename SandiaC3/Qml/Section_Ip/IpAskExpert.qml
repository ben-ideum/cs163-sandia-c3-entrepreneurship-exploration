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

        Item
        {
            anchors.fill: parent
            anchors.topMargin: 100
            anchors.bottomMargin: 100
            anchors.leftMargin: 200
            anchors.rightMargin: 200

            clip: true

            WebEngineView
            {
                id: webview
                url: "https://www.labpartnering.org/connect_with_experts"
                profile.offTheRecord: true

                anchors.fill: parent

                audioMuted: root.state === "HIDDEN"
            }
        }
    }

    onHidden: webview.reload()
}
