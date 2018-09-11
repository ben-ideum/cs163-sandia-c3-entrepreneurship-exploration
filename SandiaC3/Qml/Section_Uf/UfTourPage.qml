import QtQuick 2.0

import "../General"
import ".."

FadeState {

    id: root

    anchors.fill: parent

    Rectangle
    {
        anchors.fill: parent
        color: "black"
    }

    Rectangle
    {
        id: text_box
        width: 860
        height: 1280
        x: 200
        color: "white"

        AppText
        {
            text: "text goes here"
            color: "black"
        }
    }

    Rectangle
    {
        id: tour_box
        color: Style.cyan
        anchors.left: text_box.right
        anchors.leftMargin: 80
        width: 2500
        height: 1280
    }
}
