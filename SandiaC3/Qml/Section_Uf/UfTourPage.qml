import QtQuick 2.0
import QtWebEngine 1.5

import "../General"
import ".."

FadeState {
    property string address: ""
    property string tourText: ""
    property string textSource: ""

    id: root

    anchors.fill: parent

    signal closeItUpTheTour()

    Rectangle
    {
        anchors.fill: parent
        color: "black"
    }

    MouseArea
    {
        anchors.fill: parent
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
            text: root.tourText
            color: "black"
            anchors.fill: parent
            anchors.margins: 60
            font.pixelSize: 60
            fontSizeMode: Text.Fit
            fontPrototype: Style.font_p_book
            wrapMode: Text.Wrap
        }

        Image
        {
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            source: root.textSource
        }
    }

    Image
    {
        anchors.fill: tour_box
        fillMode: Image.PreserveAspectCrop
        source: "../../assets/tour-loading.png"
    }

    Item
    {
        id: tour_box
        anchors.left: text_box.right
        anchors.leftMargin: 80

        width: 2500
        height: 1280

        clip: true

        WebEngineView
        {
            url: root.state === "SHOWING" && root.address !== "" ? "https://"+root.address : ""
            profile.offTheRecord: true

            width: 2500
            height: 1340
            y: -60

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
        anchors.verticalCenter: tour_box.top
        anchors.horizontalCenter: tour_box.right

        MouseArea
        {
            anchors.fill: parent
            anchors.margins: -parent.height/4
            onClicked: root.closeItUpTheTour()
        }
    }
}
