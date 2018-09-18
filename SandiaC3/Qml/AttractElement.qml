import QtQuick 2.0

Image
{
    property string section: "partnerships"
    property string num: "1"
    height: 234
    width: 234
    source: "../assets/attract/"+section+"/"+section+"-0"+num+".png"
    fillMode: Image.PreserveAspectCrop

    id: root

    signal clicked()

    MouseArea
    {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
