import QtQuick
import QtQuick.Layouts

Rectangle {
    id: root

    property string lable: ""
    property color iconColor: "#3dd1b0"
    property int parentHeight: 15

    implicitWidth: clock_id.implicitWidth + 22
    implicitHeight: root.parentHeight
    color: "transparent"

    Text {
        id: clock_id

        anchors.centerIn: parent
        text: root.lable
        color: "#f5e2c5"

        font.family: "JetbrainsMono Nerd Font"
        font.pixelSize: 14

        visible: root.lable !== ""
    }
}
