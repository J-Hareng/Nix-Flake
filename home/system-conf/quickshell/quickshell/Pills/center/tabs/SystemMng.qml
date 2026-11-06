import Quickshell
import QtQuick
import QtQuick.Layouts

RowLayout {
    id: root
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.leftMargin: 10
    anchors.bottomMargin: 10
    anchors.rightMargin: 10
    spacing: armed ? 0 : 30

    Behavior on spacing {
        NumberAnimation {
            duration: 250
            easing.type: Easing.OutCubic
        }
    }

    property int state: 0
    property bool armed: false

    Rectangle {
        id: first
        property int thisState: 1

        Layout.preferredWidth: isShown(thisState) ? implicitWidth : 0
        Layout.fillWidth: isShown(thisState)

        implicitWidth: shutdown.implicitWidth + 24
        height: shutdown.height + 12
        radius: height / 3
        border.width: 1
        border.color: isActive(thisState) ? "#7ad9a8" : "#1d3631"
        color: isActive(thisState) ? "#7ad9a8" : "#0a1816"
        clip: true

        opacity: isShown(thisState) ? 1 : 0

        Behavior on opacity {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }
        Behavior on Layout.preferredWidth {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }

        Text {
            id: shutdown
            anchors.centerIn: parent
            text: "power_settings_new"
            color: isActive(first.thisState) ? "#040e0d" : "#7ad9a8"
            font.family: "Material Symbols Rounded"
            font.pixelSize: 15
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            // In the shutdown MouseArea:
            onClicked: {
                if (root.armed) {
                    Quickshell.execDetached(["systemctl", "poweroff"]);
                } else {
                    root.armed = true;
                    root.state = 1;
                    confirmTimer.restart();
                }
            }
        }
    }
    Rectangle {
        id: second
        property int thisState: 2
        Layout.preferredWidth: isShown(thisState) ? implicitWidth : 0
        Layout.fillWidth: isShown(thisState)

        implicitWidth: shutdown.implicitWidth + 24
        height: shutdown.height + 12
        radius: height / 3
        border.width: 1
        border.color: isActive(thisState) ? "#7ad9a8" : "#1d3631"
        color: isActive(thisState) ? "#7ad9a8" : "#0a1816"
        clip: true

        opacity: isShown(thisState) ? 1 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }
        Behavior on Layout.preferredWidth {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }

        Text {
            id: reboot
            anchors.centerIn: parent
            text: "restart_alt"
            color: isActive(second.thisState) ? "#040e0d" : "#7ad9a8"
            font.family: "Material Symbols Rounded"
            font.pixelSize: 15
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                if (root.armed) {
                    Quickshell.execDetached(["systemctl", "reboot"]);
                } else {
                    root.armed = true;
                    root.state = 2;
                    confirmTimer.restart();
                }
            }
        }
    }

    Rectangle {
        id: third
        property int thisState: 3
        Layout.preferredWidth: isShown(thisState) ? implicitWidth : 0
        Layout.fillWidth: isShown(thisState)

        implicitWidth: shutdown.implicitWidth + 24
        height: shutdown.height + 12
        radius: height / 3
        border.width: 1
        border.color: isActive(thisState) ? "#7ad9a8" : "#1d3631"
        color: isActive(thisState) ? "#7ad9a8" : "#0a1816"
        clip: true

        opacity: isShown(thisState) ? 1 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }
        Behavior on Layout.preferredWidth {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }

        Text {
            id: logout
            anchors.centerIn: parent
            text: "logout"
            color: isActive(third.thisState) ? "#040e0d" : "#7ad9a8"
            font.family: "Material Symbols Rounded"
            font.pixelSize: 15
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                if (root.armed) {
                    Quickshell.execDetached(["uwsm", "stop"]);
                } else {
                    root.armed = true;
                    root.state = 3;
                    confirmTimer.restart();
                }
            }
        }
    }
    Timer {
        id: confirmTimer
        interval: 2000
        onTriggered: {
            root.armed = false;
            root.state = 0;
        }
    }
    // Place at the bottom of the RowLayout, replacing the existing function.
    function isShown(itemState: int): bool {
        if (!root.armed) {
            return true;
        }
        return itemState === root.state;
    }
    function isActive(itemState: int): bool {
        return root.armed && itemState == root.state;
    }
}
