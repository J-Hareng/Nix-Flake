import Quickshell
import QtQuick
import Quickshell.Hyprland

Rectangle {
    id: root
    property string ws_index: ""

    property bool isActive: false

    property var workspace: Hyprland.workspaces[0]

    property color textColor: "#f5e2c5"
    property color backColor: "#040e0d"
    property color activeColor: "#3dd1b0"

    property int maxLableWidth: 400
    property int parentHeight: 15

    property int animationDuration: 200

    implicitWidth: isActive ? 50 : 25

    implicitHeight: parentHeight
    radius: height / 2.4

    color: isActive ? root.activeColor : root.backColor

    Text {
        id: workspace_text

        anchors.centerIn: parent
        text: root.ws_index
        color: root.isActive ? root.backColor : root.textColor

        font.bold: true
        font.family: "Iosevka Nerd Font"
        font.pixelSize: 12

        Behavior on color {
            ColorAnimation {
                duration: root.animationDuration
            }
        }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: root.animationDuration
            easing.type: Easing.Bezier
            easing.bezierCurve: [0.42, 0, 0.58, 1, 1, 1]  // same as CSS cubic-bezier(0.42,0,0.58,1)
        }
    }

    Behavior on color {
        ColorAnimation {
            duration: root.animationDuration
        }
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            root.workspace.activate();
        }
    }
    visible: workspace != null
}
