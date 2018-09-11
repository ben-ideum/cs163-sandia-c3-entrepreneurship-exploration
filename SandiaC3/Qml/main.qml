import QtQuick 2.10
import QtQuick.Window 2.10
//import QtQuick.VirtualKeyboard 2.3

import "General"
import "."
import "Section_C3"
import "Section_Uf"
import "Section_P"

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
            visible: false
        }

        SectionUf
        {
            visible: false
        }

        SectionP
        {
//            visible: false
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
