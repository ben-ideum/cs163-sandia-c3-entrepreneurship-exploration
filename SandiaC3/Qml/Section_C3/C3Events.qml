import QtQuick 2.0
import QtGraphicalEffects 1.0

import "../General"
import ".."

PageDefault
{
    property real fontSize: clmn.spacing * 3 / 4

    pageTitle: "C3 EVENTS"

    id: root

    PageBody
    {
        id: body_area

        clip: true

        state: root.state

        Rectangle
        {
            anchors.fill: parent
            color: "white"
        }

        Image
        {
            width: parent.width
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectCrop
            source: "../../assets/office-hours-background.png"
        }

        layer.enabled: true
    }

    GaussianBlur
    {
        anchors.fill: body_area
        source: body_area
        radius: 32
        samples: 32
    }

    PageBody
    {
        clip: true

        state: root.state

        Flickable
        {
            id: flick_area
            anchors.fill: parent

            contentHeight: clmn.height + clmn.spacing * 2

            Column
            {
                id: clmn
                width: body_area.width/2
                x: body_area.width/2-width/2
                spacing: body_area.height/30

                Repeater
                {
                    model: eventList

                    Item
                    {
                        width: body_area.width/2
                        height: body_area.height/2.5

                        Rectangle
                        {
                            width: parent.width
                            height: parent.height
                            anchors.centerIn: parent
                            anchors.verticalCenterOffset: -100 * fader.inOutState
                            color: "white"
                            opacity: fader.opacity

                            FadeState
                            {
                                id: fader
                                state: root.state
                                delay: index * 100
                            }

                            Item
                            {
                                id: img
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.bottom: parent.bottom
                                anchors.margins: clmn.spacing
                                width: height*4/3
                                clip: true

                                Image {
                                    source: userContent+modelData.image
                                    anchors.centerIn: parent
                                    width: parent.width
                                    height: parent.height
                                    fillMode: Image.PreserveAspectFit
                                }
                            }

                            Item
                            {
                                id: description_area
                                anchors.top: parent.top
                                anchors.bottom: parent.bottom
                                anchors.left: img.right
                                anchors.margins: clmn.spacing
                                width: parent.width/3

                                Column
                                {
                                    AppText
                                    {
                                        text: modelData.date + " | " + modelData.time
                                        color: Style.slate
                                        font.pixelSize: root.fontSize
                                    }
                                    AppText
                                    {
                                        text: modelData.title
                                        fontPrototype: Style.font_h1_bold
                                        font.pixelSize: root.fontSize*1.5
                                        color: Style.dark_cyan
                                    }
                                    Item { width: 10; height: root.fontSize }
                                    AppText
                                    {
                                        text: modelData.description
                                        font.pixelSize: root.fontSize
                                        color: Style.slate
                                        width: parent.width-clmn.spacing
                                        wrapMode: Text.Wrap
                                        lineHeight: 1.3
                                    }
                                }
                            }

                            Item
                            {
                                anchors.top: parent.top
                                anchors.right: parent.right
                                anchors.bottom: parent.bottom
                                anchors.left: description_area.right
                                anchors.topMargin: clmn.spacing
                                anchors.bottomMargin: clmn.spacing
                                anchors.leftMargin: clmn.spacing*2
                                anchors.rightMargin: clmn.spacing*2

                                Column
                                {
                                    spacing: clmn.spacing/2
                                    AppText
                                    {
                                        text: modelData.location
                                        fontPrototype: Style.font_h1_bold
                                        font.pixelSize: root.fontSize
                                        color: Style.slate
                                    }
                                    AppText
                                    {
                                        text: modelData.address_1
                                        font.pixelSize: root.fontSize
                                        color: Style.slate
                                    }
                                    AppText
                                    {
                                        text: modelData.address_2
                                        font.pixelSize: root.fontSize
                                        color: Style.slate
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    onHidden: flick_area.contentY = 0
}
