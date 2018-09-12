import QtQuick 2.10
import QtQuick.Window 2.10
//import QtQuick.VirtualKeyboard 2.3

import "General"
import "."
import "Section_C3"
import "Section_Uf"
import "Section_P"
import "Section_Ip"

Window {
    id: window
    visible: true
    width: 1920 * 2 / 3
    height: 1080 * 2 / 3
    title: qsTr("C3 Visitor Information")

    color: "black"

    flags: Qt.FramelessWindowHint

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
                state = "HIDDEN"
                c3.state = "SHOWING"
                c3.goTo(num)
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
                uf.goTo(num)
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

//    InputPanel {
//        id: inputPanel
//        z: 99
//        x: 0
//        y: window.height
//        width: window.width

//        states: State {
//            name: "visible"
//            when: inputPanel.active
//            PropertyChanges {
//                target: inputPanel
//                y: window.height - inputPanel.height
//            }
//        }
//        transitions: Transition {
//            from: ""
//            to: "visible"
//            reversible: true
//            ParallelAnimation {
//                NumberAnimation {
//                    properties: "y"
//                    duration: 250
//                    easing.type: Easing.InOutQuad
//                }
//            }
//        }
//    }
}
