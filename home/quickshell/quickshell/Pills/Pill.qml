import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string icon: ""
    property string lable: ""
    property color iconColor: "#3dd1b0"
    property int maxLableWidth: 400
    property int parentHeight: 15

    implicitWidth: row.implicitWidth + 22
    implicitHeight: root.parentHeight
    radius: height / 2
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
        Text {
            text: root.lable
            color: "#f5e2c5"
            font.family: "JetbrainsMono Nerd Font"
            font.pixelSize: 14
            elide: Text.ElideRight
            Layout.maximumWidth: root.maxLableWidth
            visible: root.lable !== ""
        }
    }
}
