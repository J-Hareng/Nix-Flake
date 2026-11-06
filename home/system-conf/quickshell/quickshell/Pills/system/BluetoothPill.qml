import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Bluetooth

Rectangle {
    id: root
    property color iconColor: "#3dd1b0"
    property int maxLabelWidth: 400
    property int parentHeight: 15

    readonly property string bluetooth_disabled: "bluetooth_disabled"
    readonly property string bluetooth_enabled: "bluetooth"
    readonly property string bluetooth_connected: "bluetooth_connected"

    readonly property BluetoothAdapter bt_adp: Bluetooth.defaultAdapter

    property bool bt_enabled: bt_adp.enabled
    property bool conected_devices: bt_adp.devices.values.some(d => d.connected)

    readonly property int animationDuration: 100

    readonly property bool hovered: mouseArea.containsMouse

    function getBluetoothIcon(enabled: bool, conected: bool): string {
        if (!enabled) {
            return root.bluetooth_disabled;
        }
        if (conected) {
            return root.bluetooth_connected;
        }
        return root.bluetooth_enabled;
    }

    implicitWidth: row.implicitWidth + 22
    implicitHeight: root.parentHeight
    radius: height / 2
    color: "#040e0d"

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 0

        Text {
            id: lable
            text: root.conected_devices_names
            color: "#f5e2c5"
            font.family: "JetbrainsMono Nerd Font"
            font.pixelSize: 14
            clip: true
            // visible: root.hovered

            opacity: root.hovered ? 1 : 0
            Layout.maximumWidth: root.hovered ? implicitWidth : 0

            Behavior on opacity {
                NumberAnimation {
                    duration: root.animationDuration
                }
            }

            Behavior on Layout.maximumWidth {
                NumberAnimation {
                    duration: root.animationDuration
                    easing.type: Easing.Bezier
                    easing.bezierCurve: [0.42, 0, 0.58, 1, 1, 1]  // same as CSS cubic-bezier(0.42,0,0.58,1)
                }
            }
        }
        Text {
            text: root.getBluetoothIcon(root.bt_enabled, root.conected_devices)
            color: root.iconColor
            font.family: "Material Symbols Rounded"
            font.pixelSize: 14
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: () => {
            Quickshell.execDetached(["ghostty", "--class=quickshell.wifipopup", "-e", "bluetui"]);
        }
    }
}
