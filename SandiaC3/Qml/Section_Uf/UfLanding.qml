import QtQuick 2.0
import QtGraphicalEffects 1.0

import "../General"
import ".."

PageDefault
{
    property string bubbleState: "HIDDEN"
    readonly property bool showSubTitle: bubbleState === "SHOWING"

    readonly property vector2d crf_loc: Qt.vector2d(crf.x+crf.width/2, crf.y+crf.height/2)
    readonly property vector2d cint_loc: Qt.vector2d(cint.x+cint.width/2, cint.y+cint.height/2)
    readonly property vector2d detl_loc: Qt.vector2d(detl.x+detl.width/2, detl.y+detl.height/2)
    readonly property vector2d nsttf_loc: Qt.vector2d(nsttf.x+nsttf.width/2, nsttf.y+nsttf.height*3/5)
    readonly property vector2d swift_loc: Qt.vector2d(swift.x+swift.width/2, swift.y+swift.height/2)

    pageTitle: "USER FACILITIES"
    subTitle: !showSubTitle ? "" : "A unique set of scientific research capabilities and resources available for use by the scientific community"
    icon_name: "uf-icon"

    id: root

    signal go(int num)

    PageBody
    {
        id: page
        clip: true
        enabled: root.bubbleState === "SHOWING"

        layer.enabled: true

        Rectangle
        {
            anchors.fill: parent
            color: "white"
        }

        Image
        {
            width: parent.width
            anchors.bottom: parent.bottom
            fillMode: Image.PreserveAspectCrop
            source: "../../assets/uf/uf-map.png"
        }

        FadeState
        {
            id: fader_ref
            state: root.bubbleState
            delay: 800
            x: 264
            y: 1032

            Image {
                source: "../../assets/uf/popup-cali.png"

                AppText
                {
                    fontPrototype: Style.font_p_bold
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Sandia California is located at the edge of the San Franciso Bay Area"
                    anchors.fill: parent
                    anchors.leftMargin: parent.width*0.04
                    anchors.rightMargin: parent.width*0.04
                    anchors.bottomMargin: parent.width*0.04
                    anchors.topMargin: parent.height*0.25
                    fontSizeMode: Text.Fit

                    font.pixelSize: parent.height/4
                    lineHeight: 1.1

                    width: parent.width*0.8
                    wrapMode: Text.Wrap
                }
            }
        }

        FadeState
        {
            state: root.bubbleState
            delay: 400
            x: 1455
            y: 80

            Image {
                source: "../../assets/uf/popup-nm.png"

                AppText
                {
                    fontPrototype: Style.font_p_bold
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Primary site is located in Albuquerque, New Mexico"
                    anchors.fill: parent
                    anchors.leftMargin: parent.width*0.04
                    anchors.rightMargin: parent.width*0.04
                    anchors.topMargin: parent.width*0.04
                    anchors.bottomMargin: parent.height*0.2
                    fontSizeMode: Text.Fit

                    font.pixelSize: parent.height/4
                    lineHeight: 1.1

                    width: parent.width*0.8
                    wrapMode: Text.Wrap
                }
            }
        }

        FadeState
        {
            state: root.bubbleState
            delay: 800
            x: 2808
            y: 1130

            Image {
                source: "../../assets/uf/popup-tx.png"

                AppText
                {
                    fontPrototype: Style.font_p_bold
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "Collaborative research in Lubbock, Texas"
                    anchors.fill: parent
                    anchors.leftMargin: parent.width*0.04
                    anchors.rightMargin: parent.width*0.08
                    anchors.bottomMargin: parent.width*0.04
                    anchors.topMargin: parent.height*0.04
                    fontSizeMode: Text.Fit

                    font.pixelSize: parent.height/4
                    lineHeight: 1.1

                    width: parent.width*0.8
                    wrapMode: Text.Wrap
                }
            }
        }

        MouseArea
        {
            id: crf
            onClicked: root.go(1)
            x: 830
            y: 640
            width: 240
            height: 120
        } // CRF

        MouseArea
        {
            id: detl
            onClicked: root.go(3)
            x: 1360
            y: 1180
            width: 240
            height: 140
        } // DETL

        MouseArea
        {
            id: nsttf
            onClicked: root.go(4)
            x: 2460
            y: 100
            width: 460
            height: 240
        } // NSTTF

        MouseArea
        {
            id: cint
            onClicked: root.go(2)
            x: 3050
            y: 580
            width: 270
            height: 180
        } // CINT

        MouseArea
        {
            id: swift
            onClicked: root.go(5)
            x: 3340
            y: 1080
            width: 220
            height: 240
        }  // SWiFT
    }

    GaussianBlur
    {
        anchors.fill: page
        source: page
        samples: 32 * fader_ref.linearState
        radius: 16 * fader_ref.linearState
    }
}
