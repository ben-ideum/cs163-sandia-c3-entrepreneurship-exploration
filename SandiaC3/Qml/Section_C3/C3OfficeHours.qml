import QtQuick 2.0

import "../General"
import ".."

PageDefault
{
    pageTitle: "C3 OFFICE HOURS"

    id: root

    PageBody
    {
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
            anchors.bottom: parent.bottom
            fillMode: Image.PreserveAspectFit
            source: "../../assets/office-hours-background.png"
        }

        Flickable
        {
            anchors.fill: parent
            contentHeight: headerText_1.contentHeight + 160

            AppText
            {
                id: headerText_1
                fontPrototype: Style.font_p
                text: "<strong>Open to the Public</strong><br>
    <i>Monday-Friday</i><br>
    9:00 a.m.- 4:00 p.m.<br>
    <br>
    Economic Development<br>
    <i>Monday-Friday</i><br>
    9:00 am-4:00pm<br>
    <br>
    Government Relations<br>
    <i>Tuesday</i><br>
    2-4:00 pm<br>
    <br>
    Licensing<br>
    <i>First Tuesday</i><br>
    9:00am-11:00 am<br>

    Partnership Agreements<br>
    <i>Wednesday</i><br>
    9:30 am-11:30am (SPP)<br>
    <br>
    Community Involvement<br>
    <i>Third Wednesday</i><br>
    1-4:00 pm<br>
    <br>
    NMSBA Program<br>
    <i>Thursday</i><br>
    1-4:00 pm<br>
    <br>
    Supplier Diversity<br>
    <i>First Thursday</i><br>
    9am-1:00 pm<br>
    <i>Third Thursday</i><br>
    12:00-4:00pm<br>
    <br>
    Principle Investigators<br>
    <i>By Appointment</i>"
                color: "black"
                horizontalAlignment: Text.AlignHCenter

                state: root.state
                delay: 200

                font.pixelSize: 100
                lineHeight: 1.3
                anchors.topMargin: font.pixelSize * (1.0 - inOutState)
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
