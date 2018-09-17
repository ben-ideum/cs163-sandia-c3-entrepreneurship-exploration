import QtQuick 2.0

import "../General"
import ".."

PageDefault
{
    pageTitle: "SUCCESS STORIES"
    subTitle: "Industrial partnerships with companies, universities, other government agencies, and national laboratories"
    icon_name: "p-icon"

    id: root

    PageBody
    {
        state: root.state

        Rectangle
        {
            anchors.fill: parent
            color: Style.gray
        }

        ListModel
        {
            id: success_model
            ListElement { px: 196; py: 641 }
            ListElement { px: 196; py: 1031 }
            ListElement { px: 196; py: 1321 }
            ListElement { px: 955; py: 641 }
            ListElement { px: 955; py: 1109 }
            ListElement { px: 955; py: 1472 }
        }

        Repeater
        {
            model: success_model

            FadeState
            {
                x: model.px
                y: model.py-Style.headerSize
                state: root.state
                delay: 200 + index*100

                Image
                {
                    source: "../../assets/p/success-text-"+(index+1)+".png"
                    y: -parent.inOutState * 100

                    MouseArea
                    {
                        anchors.fill: parent
                        onClicked: carousel.activeElement = index
                    }
                }
            }
        }

        SuccessCarousel
        {
            id: carousel
            x: 1710
        }
    }

    onHidden: carousel.reset()
}

