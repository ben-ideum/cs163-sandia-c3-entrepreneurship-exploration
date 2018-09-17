import QtQuick 2.0
import QtMultimedia 5.9

import "../General"
import ".."

FadeState {
    property int gutter: close_btn.height * 1.5
    property string videoName: ""

    property bool paused: true

    id: root

    width: 1920
    height: 1080 + gutter * 2

    signal done()

    Rectangle
    {
        anchors.fill: parent
        color: "black"
        radius: 40

        MouseArea { anchors.fill: parent }

        Image {
            id: close_btn
            source: "../../assets/close-button.png"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: height/2
            anchors.topMargin: height/4

            MouseArea
            {
                anchors.fill: parent
                anchors.margins: -40
                onClicked: root.done()
            }
        }
    }

    Item
    {
        anchors.fill: parent
        anchors.topMargin: root.gutter
        anchors.bottomMargin: root.gutter

        Rectangle { height: 2; width: parent.width; anchors.bottom: parent.top; color: "white" }
        Rectangle { height: 2; width: parent.width; anchors.top: parent.bottom; color: "white" }

        Video
        {
            id: video
            source: root.videoName === "" ? "" : contentPath+"rd100-videos/"+root.videoName+".mp4"
            autoLoad: true
            autoPlay: false
            anchors.fill: parent
            fillMode: VideoOutput.PreserveAspectCrop

            onPaused: root.paused = true
            onStopped: root.paused = true
            onPlaying: root.paused = false
        }

        Rectangle
        {
            anchors.fill: parent
            opacity: root.paused ? 0.6 : 0.0
            color: "black"
            Behavior on opacity { NumberAnimation { duration: 200 } }

            Image {
                anchors.centerIn: parent
                source: "../../assets/icon-play.png"

                fillMode: Image.PreserveAspectFit
                height: parent.height/5
                width: height
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked: root.paused ? video.play() : video.pause()
            }
        }
    }

    Item
    {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        height: root.gutter

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: close_btn.height/2
            fillMode: Image.PreserveAspectFit
            height: parent.height*2/3
            width: height
            source: "../../assets/icon-rewind.png"

            MouseArea
            {
                anchors.fill: parent
                onClicked: video.seek(video.position - 30000)
            }
        }

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: close_btn.height/2
            fillMode: Image.PreserveAspectFit
            height: parent.height*2/3
            width: height
            source: "../../assets/icon-skip.png"

            MouseArea
            {
                anchors.fill: parent
                onClicked: video.seek(video.position + 30000)
            }
        }

        AppText
        {
            anchors.centerIn: parent
            font.pixelSize: parent.height/3
            text: root.format(video.position) + " / " + root.format(video.duration)
        }
    }

    onOpacityChanged: if (opacity === 0) { video.stop() }

    function format(ms) {
        var sec = ms/1000.0
        var ss = Math.floor(sec % 60.0);
        var mm = Math.floor(sec/60.0)
        return str_pad_left(mm, '0', 2)+":"+str_pad_left(ss, '0', 2)
    }

    function str_pad_left(string,pad,length) {
        return (new Array(length+1).join(pad)+string).slice(-length);
    }
}
