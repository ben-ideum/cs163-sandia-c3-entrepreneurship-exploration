import QtQuick 2.10
import QtQuick.Window 2.10

import "General"
import "."
import "Section_C3"
import "Section_Uf"
import "Section_P"
import "Section_Ip"

Window {
    id: window
    visible: true
    width: Screen.width//1920 * 2 / 3
    height: Screen.height//1080 * 2 / 3
    title: qsTr("C3 Visitor Information")

    color: "black"

    flags: Qt.FramelessWindowHint

    Connections
    {
        target: backend

        onProcessDone: window.show()
    }

    Item
    {
        width: Style.resolution.x
        height: Style.resolution.y
        scale: parent.width/width
        anchors.centerIn: parent

        focus: true

        Keys.onEscapePressed: Qt.quit()

        SectionC3
        {
            id: c3

            onLaunchPresentation:
            {
                window.hide()
                backend.launchPresentation()
            }

            onLaunchWhiteboard:
            {
                window.hide()
                backend.launchWhiteboard()
            }
        }

        SectionUf
        {
            id: uf
        }

        SectionP
        {
            id: p
        }

        SectionIp
        {
            id: ip
        }

        Attract
        {
            id: attract
            anchors.fill: parent

            state: "SHOWING"

            onGoC3:
            {
                if (num == 4) {
                    c3.launchPresentation()
                } else if (num === 5) {
                    c3.launchWhiteboard()
                } else {
                    state = "HIDDEN"
                    c3.state = "SHOWING"
                    c3.goTo(num)
                }
            }

            onGoPartnerships:
            {
                state = "HIDDEN"
                p.state = "SHOWING"
                p.goTo(num)
            }

            onGoMap:
            {
                state = "HIDDEN"
                uf.state = "SHOWING"
                uf.goTour(num)
            }

            onGoIp:
            {
                state = "HIDDEN"
                ip.state = "SHOWING"
                ip.goTo(num)
            }


            Rectangle
            {
                property bool expanded: false
                anchors.bottom: parent.bottom
                anchors.bottomMargin: expanded ? 140 : 0
                Behavior on anchors.bottomMargin { NumberAnimation { duration: 200 } }

                x: 100
                width: 60
                height: 60
                color: Qt.rgba(0,0,0,expanded ? 0 : 0.3)
                Behavior on color { ColorAnimation { duration: 200 } }

                FadeState
                {
                    id: move_up_btn
                    state: parent.expanded ? "HIDDEN" : "SHOWING"
                    anchors.centerIn: parent
                    Image {
                        anchors.centerIn: parent
                        source: "../assets/expand-up.png"
                        scale: 0.6
                    }
                }

                FadeState
                {
                    id: move_down_btn
                    state: parent.expanded ? "SHOWING" : "HIDDEN"
                    anchors.centerIn: parent
                    Image {
                        anchors.centerIn: parent
                        rotation: 180
                        source: "../assets/expand-up.png"
                        scale: 0.6
                    }
                }

                Rectangle
                {
                    opacity: move_down_btn.opacity
                    width: 950
                    height: 200
                    color: Qt.rgba(0,0,0,0.3)

                    Image {
                        id: logo
                        source: "../assets/sandia-logo.png"
                        anchors.verticalCenter: parent.verticalCenter
                        x: 40
                        height: parent.height-80
                        fillMode: Image.PreserveAspectFit
                        opacity: 0.75
                    }

                    AppText
                    {
                        anchors.left: logo.right
                        anchors.leftMargin: 40
                        anchors.verticalCenter: parent.verticalCenter
                        height: parent.height-80
                        anchors.right: parent.right
                        anchors.rightMargin: 40
                        wrapMode: Text.Wrap
                        opacity: 0.5
                        font.pixelSize: 50
                        fontSizeMode: Text.Fit
                        text: "Sandia National Laboratories is a multimission laboratory managed and operated by National Technology and Engineering Solutions of Sandia, LLC., a wholly owned subsidiary of Honeywell International, Inc., for the U.S. Department of Energy's National Nuclear Security Agency."
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: parent.parent.expanded = !parent.parent.expanded
                    }
                }
            }
        }
    }

    Connections
    {
        target: GlobalSignals

        onGoHome:
        {
            attract.state = "SHOWING"

            c3.state = "HIDDEN"
            c3.goHome()

            uf.state = "HIDDEN"
            uf.goHome()

            p.state = "HIDDEN"
            p.goHome()

            ip.state = "HIDDEN"
            ip.goHome()
        }
    }
}
