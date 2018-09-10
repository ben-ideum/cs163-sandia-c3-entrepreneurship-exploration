import QtQuick 2.0

import "../General"
import ".."

PageBody {

    property vector2d marker_loc: Qt.vector2d(0,0)

    Image {
        source: "../../assets/marker.png"
        x: marker_loc.x - width/2
        y: marker_loc.y - height
    }
}
