import QtQuick 2.0

Item
{
    property string section: "partnerships"
    property string num: "1"

    property alias fillMode: img.fillMode

    id: root

    height: 234
    width: 234

    signal clicked()

    Image
    {
        id: img
        source: "../assets/attract/"+root.section+"/"+root.section+"-0"+root.num+".png"
        fillMode: Image.PreserveAspectCrop
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
