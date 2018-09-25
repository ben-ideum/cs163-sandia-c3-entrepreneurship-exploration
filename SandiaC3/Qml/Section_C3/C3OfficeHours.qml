import QtQuick 2.0

import "../General"
import ".."

PageDefault
{
    pageTitle: "C3 OFFICE HOURS"

    id: root

    PageHeader
    {
        AppText
        {
            fontPrototype: Style.font_p

            horizontalAlignment: Text.AlignHCenter

            state: root.state
            delay: 200

            font.pixelSize: 60
            lineHeight: 1.1
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: - inOutState * 100 + 50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: parent.width/5

            text: "Open to the public<br>Monday-Friday<br>9:00am - 4:00pm<br>"
        }
    }

    PageBody
    {
        id: body
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

        Grid
        {
            id: grid
            property int textWidth: (parent.width-spacing*5)/4
            columns: 4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 140
            spacing: 200

            Repeater
            {
                model: officeHours

                Column
                {
                    width: grid.textWidth
                    AppText
                    {
                        width: parent.width
                        text: modelData.service
                        color: Style.orange
                        fontPrototype: Style.font_p_bold
                        font.pixelSize: 56
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    AppText
                    {
                        width: parent.width
                        text: modelData.hours
                        color: "black"
                        fontPrototype: Style.font_p_book
                        font.pixelSize: 56
                        horizontalAlignment: Text.AlignHCenter
                        lineHeight: 1.1
                    }
                }
            }
        }
    }
}
