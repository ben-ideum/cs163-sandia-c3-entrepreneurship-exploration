import QtQuick 2.0

import "../General"
import "SignIn"
import ".."

PageDefault
{
    pageTitle: "VISITOR INFORMATION"

    id: root

    PageBody
    {
        id: page

        property bool all_good: first_name.valid && last_name.valid && e_mail.valid && visitor_type.valid

        state: root.state

        MouseArea
        {
            anchors.fill: parent
            onClicked: forceActiveFocus()
        }

        SignInField
        {
           id: first_name
           property bool valid: entry !== ""
           x: 536
           y: 100
           onGoNext: last_name.activate()
        }

        SignInField
        {
            id: last_name
            property bool valid: entry !== ""
           x: 536
           y: 300
           defaultText: "Required"
           fieldName: "Last Name"
           onGoNext: e_mail.activate()
        }

        SignInField
        {
            id: e_mail
            property bool valid: entry !== ""
           x: 536
           y: 500
           defaultText: "name@example.com"
           fieldName: "E-mail"

           isEmail: true
           onGoNext: citizenships.activate()
        }

        SignInDropdown
        {
            id: visitor_type
            property bool valid: choice !== ""
            x: 536
            y: 700
        }

        SignInUSCitizen
        {
            id: us_citizen
            x: 1550
            y: 220
        }

        SignInOtherCitizenships
        {
            id: citizenships
            x: 2435
            y: 220
        }

        Rectangle
        {
            id: submit_box
            color: "white"
            anchors.bottom: parent.bottom
            x: 304
            width: 490
            height: 166
            radius: 4

            SequentialAnimation
            {
                id: alert

                ColorAnimation {
                    target: submit_box
                    property: "color"
                    from: "white"
                    to: "#EBB8B8"
                    duration: 150
                }
                ColorAnimation {
                    target: submit_box
                    property: "color"
                    to: "white"
                    from: "#EBB8B8"
                    duration: 150
                }
                ColorAnimation {
                    target: submit_box
                    property: "color"
                    from: "white"
                    to: "#EBB8B8"
                    duration: 150
                }
                ColorAnimation {
                    target: submit_box
                    property: "color"
                    to: "white"
                    from: "#EBB8B8"
                    duration: 150
                }
                ColorAnimation {
                    target: submit_box
                    property: "color"
                    from: "white"
                    to: "#EBB8B8"
                    duration: 150
                }
                ColorAnimation {
                    target: submit_box
                    property: "color"
                    to: "white"
                    from: "#EBB8B8"
                    duration: 150
                }
            }

            AppText
            {
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: "Submit"
                color: Style.orange
                font.pixelSize: parent.height/2.5
                fontPrototype: Style.font_h1_bold
            }

            AppText
            {
                id: confirm_text
                anchors.left: parent.right
                anchors.leftMargin: 46
                height: parent.height
                width: parent.width
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                text: "Submitted!"
                color: "white"
                font.pixelSize: parent.height/3
                fontPrototype: Style.font_h1_bold
                opacity: 0

                NumberAnimation
                {
                    id: confirm_anim
                    target: confirm_text
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 1500
                }
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked:
                {
                    root.forceActiveFocus()
                    if (page.all_good) {
                        backend.dumpVisitorInfo(first_name.entry+"\t"+last_name.entry+"\t"+e_mail.entry+"\t"+visitor_type.choice+"\t"+us_citizen.citizen+"\t"+citizenships.entry)
                        first_name.inputArea.text = ""
                        last_name.inputArea.text = ""
                        e_mail.inputArea.text = ""
                        visitor_type.choice = ""
                        us_citizen.citizen = false
                        citizenships.inputArea.text = ""
                        confirm_anim.start()
                    } else {
                        alert.start()
                        if (!first_name.valid) {
                            first_name.throwError("Enter your first name.")
                        }
                        if (!last_name.valid) {
                            last_name.throwError("Enter your last name.")
                        }
                        if (!e_mail.valid) {
                            e_mail.throwError("Enter a valid e-mail.")
                        }
                        if (!visitor_type.valid) {
                            visitor_type.throwError("Select a visitor type.")
                        }
                    }
                }
            }
        }
    }
}
