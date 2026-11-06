import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    // property string icon: ""
    // property color iconColor: "#3dd1b0"
    property int maxLableWidth: 400
    property int parentHeight: 15

    property color active_bg: "#5fc8d4"
    property color inactive_bg: "#0a1816"
    property color inactive_border: "#152a26"

    implicitWidth: row.implicitWidth + 22
    implicitHeight: row.height + 20
    radius: height / 1.3
    color: "#040e0d"

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 7

        Text {
            text: root.icon
            color: root.iconColor
            font.family: "Material Symbols Rounded"
            font.pixelSize: 14
            visible: root.icon !== ""
        }
    }
}
