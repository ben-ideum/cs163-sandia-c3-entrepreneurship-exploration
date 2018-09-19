import QtQuick 2.0

import "General"
import "."

FadeState {

    readonly property real scaleUp: 1.025

    property int activeSection: -1

    readonly property var ufRemap: [0,2,5,3,4,1,3]

    id: root

    signal goC3(int num)
    signal goPartnerships(int num)
    signal goMap(int num)
    signal goIp(int num)

    FadeState
    {
        id: partnerships_fade
        delay: 200
        state: root.state
        duration: 800
    }

    Item
    {
        readonly property int target: 0
        id: partnerships_fade_b
        opacity: root.activeSection === -1 || root.activeSection === target ? 1.0 : 0.3
        Behavior on opacity { NumberAnimation { duration: 200 } }
        scale: root.activeSection === target ? root.scaleUp : 1.0
        Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.OutBack } }
    }

    FadeState
    {
        id: c3_fade
        delay: 600
        state: root.state
        duration: 800
    }

    Item
    {
        readonly property int target: 1
        id: c3_fade_b
        opacity: root.activeSection === -1 || root.activeSection === target ? 1.0 : 0.3
        Behavior on opacity { NumberAnimation { duration: 200 } }
        scale: root.activeSection === target ? root.scaleUp : 1.0
        Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.OutBack } }
    }

    FadeState
    {
        id: map_fade
        delay: 1400
        state: root.state
        duration: 800
    }

    Item
    {
        readonly property int target: 2
        id: map_fade_b
        opacity: root.activeSection === -1 || root.activeSection === target ? 1.0 : 0.3
        Behavior on opacity { NumberAnimation { duration: 200 } }
        scale: root.activeSection === target ? root.scaleUp : 1.0
        Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.OutBack } }
    }

    FadeState
    {
        id: ip_fade
        delay: 1000
        state: root.state
        duration: 800
    }

    Item
    {
        readonly property int target: 3
        id: ip_fade_b
        opacity: root.activeSection === -1 || root.activeSection === target ? 1.0 : 0.3
        Behavior on opacity { NumberAnimation { duration: 200 } }
        scale: root.activeSection === target ? root.scaleUp : 1.0
        Behavior on scale { NumberAnimation { duration: 200; easing.type: Easing.OutBack } }
    }

    Image
    {
        source: "../assets/attract-background.png"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    AppText
    {
        text: "The Center for Collaboration and Commercialization (C3)"
        font.pixelSize: 110
        anchors.horizontalCenter: parent.horizontalCenter
        y: 40
    }

    AttractElement
    {
        section: "home"
        num: "1"
        x: 438
        y: 193
        opacity: root.activeSection === -1 ? 1.0 : 0.3
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }

    Item
    {
        id: partnership
        x: 438 - partnerships_fade.inOutState * 100
        y: 193 + 234 + 9
        opacity: Math.min(partnerships_fade.opacity, partnerships_fade_b.opacity)

        Column
        {
            spacing: 9

            Repeater {
                model: 4

                AttractElement
                {
                    section: "partnerships"
                    num: index+1
                    scale: partnerships_fade_b.scale

                    onClicked: root.goPartnerships(index+1)
                }
            }
        }
    }

    Item
    {
        id: awards
        x: 438 + 234 + 9 - partnerships_fade.inOutState * 100
        y: 193 + 234 + 9
        opacity: Math.min(partnerships_fade.opacity, partnerships_fade_b.opacity)

        Column
        {
            spacing: 9

            Repeater {
                model: 3

                AttractElement
                {
                    section: "partnerships"
                    num: index+5
                    scale: partnerships_fade_b.scale

                    onClicked: root.goPartnerships(index+5)
                }
            }
        }
    }

    Item
    {
        id: c3
        x: 438 + (234 + 9) * 2
        y: 193 + 234 + 9  - c3_fade.inOutState * 100
        opacity: Math.min(c3_fade.opacity, c3_fade_b.opacity)

        Row
        {
            spacing: 9

            Repeater {
                model: 5

                AttractElement
                {
                    scale: c3_fade_b.scale
                    section: "c3"
                    num: index + 1
                    width: 209
                    onClicked: root.goC3(index+1)
                }
            }
        }
    }

    Item
    {
        id: map
        x: 438 + (234 + 9) * 2 + (209 + 9) * 5
        y: 193  - map_fade.inOutState * 100
        opacity: Math.min(map_fade.opacity, map_fade_b.opacity)

        Row
        {
            spacing: 9

            Repeater {
                model: 4

                AttractElement
                {
                    section: "map"
                    num: index
                    scale: map_fade_b.scale
                    onClicked: root.goMap(root.ufRemap[index])
                }
            }
        }

        Row
        {
            x: 234+9
            y: 234+9
            spacing: 9

            Repeater {
                model: 3

                AttractElement
                {
                    section: "map"
                    num: index + 4
                    scale: map_fade_b.scale
                    onClicked: root.goMap(root.ufRemap[index+4])
                }
            }
        }
    }

    Item
    {
        id: ip
        x: 438 + (234 + 9) * 2 + (209 + 9) * 5 + ip_fade.inOutState * 100
        y: 193 + 234 + 9

        opacity: Math.min(ip_fade.opacity, ip_fade_b.opacity)

        AttractElement
        {
            section: "ip"
            num: "1"
            scale: ip_fade_b.scale
            onClicked: root.goIp(10) // lab experts
        }

        Item
        {
            x: (234 + 9) * 4


            AttractElement
            {
                section: "ip"
                num: "2"
                y: - (234 + 9)
                scale: ip_fade_b.scale
                onClicked: root.goIp(9) // visual patent search
            }


            AttractElement
            {
                section: "ip"
                num: "3"
                scale: ip_fade_b.scale
                onClicked: root.goIp(0) // licensible tech
            }
        }
    }

    Item
    {
        id: lt
        x: 438 + (234 + 9) * 7 + (209 + 9) * 5 + ip_fade.inOutState * 100
        y: 193
        opacity: Math.min(ip_fade.opacity, ip_fade_b.opacity)

        Column
        {
            spacing: 9

            Repeater {
                model: 8

                AttractElement
                {
                    section: "patents"
                    num: index+1
                    scale: ip_fade_b.scale
                    onClicked: root.goIp(index+1)
                }
            }
        }
    }

    property var keyLink: [partnerships_fade, partnerships_fade, c3_fade, ip_fade, map_fade, map_fade, ip_fade, ip_fade]

    property var keyLink2: [partnerships_fade_b, partnerships_fade_b, c3_fade_b, ip_fade_b, map_fade_b, map_fade_b, ip_fade_b, ip_fade_b]

    property var keySignals: [goPartnerships, goPartnerships, goC3, goIp, goMap, goMap, goIp, goIp]

    Item
    {
        x: 1238
        y: 889+100

        Column
        {
            spacing: 70

            Repeater
            {
                model: 4

                Item
                {
                    clip: true
                    width: 500
                    height: 78
                    opacity: Math.min(root.keyLink[index].opacity, root.keyLink2[index].opacity)
                    scale: root.keyLink2[index].scale * 1.1

                    Image
                    {
                        y: -parent.y-100
                        source: "../assets/attract/key.png"
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: root.keySignals[index](0)
                    }

//                    Rectangle { anchors.fill: parent; color: "yellow"; opacity: 0.3 }
                }
            }
        }


        Column
        {
            x: 550
            spacing: 70

            Repeater
            {
                model: 4

                Item
                {
                    clip: true
                    width: 700
                    height: 78
                    opacity: Math.min(root.keyLink[index+4].opacity, root.keyLink2[index+4].opacity)
                    scale: root.keyLink2[index+4].scale * 1.1

                    Image
                    {
                        x: -550
                        y: -parent.y-100
                        source: "../assets/attract/key.png"
                    }

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: root.keySignals[index+4](0)
                    }

//                    Rectangle { anchors.fill: parent; color: "yellow"; opacity: 0.3 }
                }
            }
        }
    }
}
