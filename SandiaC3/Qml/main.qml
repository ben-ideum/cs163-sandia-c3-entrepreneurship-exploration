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
