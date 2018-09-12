import QtQuick 2.0

import "../General"
import ".."

PageDefault
{
    property string bodyText: ""
    property string col1Text: ""
    property string col2Text: ""
    property string elementIcon: "lt-1"

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

        FadeState
        {
            x: 281
            y: 401-Style.headerSize
            state: root.state
            delay: 200

            Image {
                source: "../../assets/ip/"+root.elementIcon+".png"
                y: parent.inOutState * -100
            }
        }

        AppText
        {
            anchors.fill: parent
            anchors.leftMargin: 868
            anchors.rightMargin: 260
            anchors.topMargin: 100
            anchors.bottomMargin: 100
            font.pixelSize: 50
            fontPrototype: Style.font_p_book
            color: "black"
            state: root.state
            delay: 300
            text: root.bodyText
        }

        AppText
        {
            anchors.fill: parent
            anchors.leftMargin: 736
            anchors.rightMargin: 1600
            anchors.topMargin: 60
            anchors.bottomMargin: 100
            font.pixelSize: 50
            fontPrototype: Style.font_p_book
            color: "black"
            state: root.state
            delay: 300
            text: root.col1Text
            wrapMode: Text.Wrap
            lineHeight: 1.1
            fontSizeMode: Text.Fit
        }

        AppText
        {
            anchors.fill: parent
            anchors.leftMargin: 2311
            anchors.rightMargin: 0
            anchors.topMargin: 60
            anchors.bottomMargin: 100
            font.pixelSize: 50
            fontPrototype: Style.font_p_book
            color: "black"
            state: root.state
            delay: 300
            text: root.col2Text
            wrapMode: Text.Wrap
            lineHeight: 1.1
            fontSizeMode: Text.Fit
        }
    }
}
