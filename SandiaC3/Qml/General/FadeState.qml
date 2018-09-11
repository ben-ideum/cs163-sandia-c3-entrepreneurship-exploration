import QtQuick 2.0

Item {

    property int delay: 0
    property int duration: 400

    property real linearState: 0
    property real inOutState: 0

    readonly property real inOutToShow: 1-inOutState
    readonly property real linearToShow: 1-linearState

    opacity: 1-linearState

    id: root

    state: "HIDDEN"

    states: [
        State {
            name: "SHOWING"
            PropertyChanges {
                target: root
                linearState: 0
                inOutState: 0
            }
        },
        State {
            name: "HIDDEN"
            PropertyChanges {
                target: root
                linearState: 1
                inOutState: 1
            }
        }
    ]

    transitions: [
        Transition {
            to: "SHOWING"
            SequentialAnimation
            {
                PauseAnimation {
                    duration: root.delay
                }
                ParallelAnimation
                {
                    NumberAnimation {
                        target: root
                        property: "inOutState"
                        duration: root.duration
                        easing.type: Easing.InOutQuad
                    }
                    NumberAnimation {
                        target: root
                        property: "linearState"
                        duration: root.duration
                    }
                }
            }
        },
        Transition {
            to: "HIDDEN"
            ParallelAnimation
            {
                NumberAnimation {
                    target: root
                    property: "inOutState"
                    duration: root.duration
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: root
                    property: "linearState"
                    duration: root.duration
                }
            }
        }
    ]
}
