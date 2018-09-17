import QtQuick 2.0

import "General"
import "."

FadeState {

    readonly property var ufRemap: [0,2,5,4,1,3]

    id: root

    signal goC3(int num)
    signal goPartnerships(int num)
    signal goMap(int num)
    signal goIp(int num)

    Image
    {
        source: "../assets/attract-background.png"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }

    AppText
    {
        text: "The Center for Collaboration and Commercialization (C3)"
        font.pixelSize: 100
        anchors.horizontalCenter: parent.horizontalCenter
        y: 40
    }

    Item
    {
        id: partnership
        x: 438; y: 193 + 234 + 9

        Column
        {
            spacing: 9

            Repeater {
                model: 4

                MouseArea
                {
                    opacity: 0.3
                    height: 234
                    width: 234
                    onClicked: root.goPartnerships(index+1)
                }
            }
        }
    }

    Item
    {
        id: awards
        x: 438 + 234 + 9; y: 193 + 234 + 9

        Column
        {
            spacing: 9

            Repeater {
                model: 3

                MouseArea
                {
                    height: 234
                    width: 234
                    onClicked: root.goPartnerships(index + 5)
                }
            }
        }
    }

    Item
    {
        id: c3
        x: 438 + (234 + 9) * 2
        y: 193 + 234 + 9

        Row
        {
            spacing: 9

            Repeater {
                model: 5

                MouseArea
                {
                    opacity: 0.3
                    height: 234
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
        y: 193

        Row
        {
            spacing: 9

            Repeater {
                model: 3

                MouseArea
                {
                    opacity: 0.3
                    height: 234
                    width: 234
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

                MouseArea
                {
                    opacity: 0.3
                    height: 234
                    width: 234
                    onClicked: root.goMap(root.ufRemap[index+3])
                }
            }
        }
    }

    Item
    {
        id: ip
        x: 438 + (234 + 9) * 2 + (209 + 9) * 5
        y: 193 + 234 + 9

        MouseArea
        {
            height: 234
            width: 234
            onClicked: root.goIp(10) // lab experts
        }

        Item
        {
            x: (234 + 9) * 4

            MouseArea
            {
                y: - (234 + 9)
                height: 234
                width: 234
                onClicked: root.goIp(9) // visual patent search
            }

            MouseArea
            {
                height: 234
                width: 234
                onClicked: root.goIp(0) // licensible tech
            }
        }
    }

    Item
    {
        id: lt
        x: 438 + (234 + 9) * 7 + (209 + 9) * 5
        y: 193

        Column
        {
            spacing: 9

            Repeater {
                model: 8

                MouseArea
                {
                    height: 234
                    width: 234
                    onClicked: root.goIp(index+1)
                }
            }
        }
    }
}
