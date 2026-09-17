import Quickshell
import QtQuick
import QtQuick.Layouts

RowLayout {
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.leftMargin: 10
    anchors.bottomMargin: 10
    anchors.rightMargin: 10
    spacing: 30
    property bool armed: false
    Rectangle {
        Layout.fillWidth: true
        height: shutdown.height + 12
        radius: height / 3
        border.width: 1
        border.color: "#1d3631"
        color: "#0a1816"

        Text {
            id: shutdown
            anchors.centerIn: parent
            text: "power_settings_new"
            color: "#7ad9a8"
            font.family: "Material Symbols Rounded"
            font.pixelSize: 15
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (armed) {
                    onClicked: Quickshell.execDetached(["systemctl", "poweroff"]);             // shutdown
                } else {
                    armed = true;
                    confirmTimer.restart();
                }
            }
        }
    }
    Rectangle {
        Layout.fillWidth: true
        height: reboot.height + 12
        radius: height / 3
        border.width: 1
        border.color: "#1d3631"
        color: "#0a1816"

        Text {
            id: reboot
            anchors.centerIn: parent
            text: "restart_alt"
            color: "#7ad9a8"
            font.family: "Material Symbols Rounded"
            font.pixelSize: 15
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (armed) {
                    Quickshell.execDetached(["systemctl", "reboot"]);
                } else {
                    armed = true;
                    confirmTimer.restart();
                }
            }
        }
    }

    Rectangle {
        Layout.fillWidth: true
        height: logout.height + 12
        radius: height / 3
        border.width: 1
        border.color: "#1d3631"
        color: "#0a1816"

        Text {
            id: logout
            anchors.centerIn: parent
            text: "logout"
            color: "#7ad9a8"
            font.family: "Material Symbols Rounded"
            font.pixelSize: 15
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                if (armed) {
                    onClicked: Quickshell.execDetached(["uwsm", "stop"]);       // logout
                } else {
                    armed = true;
                    confirmTimer.restart();
                }
            }
        }
    }
    Timer {
        id: confirmTimer
        interval: 2000
        onTriggered: armed = false
    }
}
