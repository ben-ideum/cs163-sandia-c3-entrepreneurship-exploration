import QtQuick 2.0

import ".."

FadeState {

    id: root

    width: Style.resolution.x
    height: Style.resolution.y

    duration: 200

    enabled: opacity === 1.0

    signal menuClicked()
    signal homeClicked()

    onOpacityChanged: if (opacity === 0.0) { root.hidden() }

    signal hidden()

    Rectangle
    {
        anchors.fill: parent
        color: "black"
    }

    Item
    {
        id: header
        width: parent.width
        height: Style.sectionHeaderSize

        Image
        {
            source: "../../assets/sandia-logo.png"
            height: home_button.height
            fillMode: Image.PreserveAspectFit
            x: parent.height/4
            anchors.verticalCenter: parent.verticalCenter

            MouseArea
            {
                anchors.fill: parent
                onClicked: GlobalSignals.goHome()
            }
        }

        Image
        {
            id: menu_button

            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: width/2
            anchors.topMargin: height/2

            source: "../../assets/hamburger.png"

            MouseArea
            {
                anchors.fill: parent
                onClicked: root.menuClicked()
            }
        }

        Image
        {
            id: home_button

            height: parent.height/2
            fillMode: Image.PreserveAspectFit

            anchors.right: menu_button.left
            anchors.rightMargin: menu_button.width * 1.5

            anchors.verticalCenter: parent.verticalCenter

            source: "../../assets/section-c3-logo.png"

            MouseArea
            {
                anchors.fill: parent
                onClicked: GlobalSignals.goHome()
            }

        }
    }
}
