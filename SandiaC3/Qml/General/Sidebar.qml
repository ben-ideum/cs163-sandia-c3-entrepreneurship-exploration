import QtQuick 2.0

import ".."

Rectangle {

    property var buttons: ["C3 Home", "Presentation Mode", "White Board", "Events", "Office Hours", "Sign-In Form"]
    property int activeArea: 0

    id: root

    height: parent.height
    width: Style.resolution.x/4
    anchors.left: parent.right

    color: "white"

    state: "HIDDEN"

    signal show();
    signal hide();
    signal setArea(int num)

    Connections
    {
        target: GlobalSignals
        onGoHome: root.hide()
    }

    MouseArea
    {
        enabled: root.state === "SHOWING"
        width: Style.resolution.x
        height: Style.resolution.y
        anchors.right: parent.right
        onPressed:
        {
            mouse.accepted = false;
            root.hide();
        }
    }

    Column
    {
        width: parent.width

        Rectangle
        {
            id: header
            height: root.height * 0.04
            width: parent.width
            color: Style.slate

            Item
            {
                id: header_text
                anchors.fill: parent
                anchors.margins: parent.height/6

                Row
                {
                    id: menu_buttons
                    height: header_text.height
                    spacing: header_text.anchors.margins

                    AppText
                    {
                        id: txt
                        text: "Main Menu"
                        font.pixelSize: parent.height/3
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    Image
                    {
                        id: home_button
                        source: "../../assets/button-home.png"
                        height: header_text.height
                        fillMode: Image.PreserveAspectFit
                    }
                }

                MouseArea
                {
                    anchors.fill: menu_buttons
                    onClicked: GlobalSignals.goHome()
                }

                MouseArea
                {
                    anchors.fill: menu_buttons
                    onClicked: GlobalSignals.goHome()
                }
            }
        }

        Rectangle
        {
            height: header.height * 2 / 3
            width: parent.width
            color: Style.charcoal
        }

        Item
        {
            height: header.height / 4
            width: parent.width
        }

        Repeater
        {
            model: root.buttons

            SidebarButton
            {
                text: modelData
                selected: root.activeArea == index
                onClicked: { root.setArea(index); root.hide() }
            }
        }
    }

    Rectangle { width: 2; height: parent.height; color: Style.slate; opacity: 0.4}

    onShow: state = "SHOWING"
    onHide: state = "HIDDEN"

    states: [
        State {
            name: "SHOWING"
            PropertyChanges {
                target: root
                anchors.leftMargin: -root.width
            }
        },
        State {
            name: "HIDDEN"
            PropertyChanges {
                target: root
                anchors.leftMargin: 0
            }
        }
    ]

    transitions: [
        Transition {
            NumberAnimation {
                target: root
                property: "anchors.leftMargin"
                duration: 400
                easing.type: Easing.InOutQuad
            }
        }
    ]
}
