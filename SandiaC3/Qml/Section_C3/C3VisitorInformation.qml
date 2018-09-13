import QtQuick 2.0

import "../General"
import "SignIn"

PageDefault
{
    pageTitle: "VISITOR INFORMATION"

    id: root

    PageBody
    {
        state: root.state

        MouseArea
        {
            anchors.fill: parent
            onClicked: forceActiveFocus()
        }

        SignInField
        {
           x: 536
           y: 100
        }
    }
}
