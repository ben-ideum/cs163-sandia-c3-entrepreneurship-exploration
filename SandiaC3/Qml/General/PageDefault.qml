import QtQuick 2.0

import ".."

FadeState {

    property string pageTitle: "C3 Events"
    property string subTitle: ""
    property string icon_name: "c3_icon"

    id: root

    enabled: opacity === 1.0

    width: Style.resolution.x
    height: Style.resolution.y

    signal menuClicked()
    signal backClicked()
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
        height: Style.headerSize

        AppText
        {
            anchors.verticalCenter: parent.verticalCenter
            x: parent.height/2
            text: root.pageTitle.toUpperCase()
            font.pixelSize: parent.height/4
        }

        AppText
        {
            anchors.left: parent.left
            anchors.right: home_button.left
            anchors.leftMargin: parent.height/2
            anchors.verticalCenter: parent.bottom
            anchors.verticalCenterOffset: -font.pixelSize
            font.pixelSize: parent.height/8

            fontSizeMode: Text.HorizontalFit
            text: root.subTitle
        }

        Image
        {
            id: back_button
            source: "../../assets/back-arrow.png"
            height: parent.height/6
            fillMode: Image.PreserveAspectFit
            x: width/2
            y: height/2

            MouseArea
            {
                anchors.fill: parent
                onClicked: root.backClicked()
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

            height: parent.height*3/4
            fillMode: Image.PreserveAspectFit

            anchors.right: menu_button.left
            anchors.top: menu_button.top
            anchors.rightMargin: menu_button.width

            source: "../../assets/"+root.icon_name+".png"

            MouseArea
            {
                anchors.fill: parent
                onClicked: root.homeClicked()
            }
        }
    }

    Item
    {
        id: footer
        anchors.bottom: parent.bottom
        width: parent.width
        height: Style.footerSize

        Image
        {
            source: "../../assets/section-c3-logo.png"
            height: parent.height/2
            fillMode: Image.PreserveAspectFit
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: parent.height/6
        }
    }
}
