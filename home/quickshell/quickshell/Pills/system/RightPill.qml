import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../src/"
import "../../Pills/"

Rectangle {
    id: root

    property int parentHeight: 15

    property color textColor: "#f5e2c5"
    property color backColor: "#040e0d"
    property color activeColor: "#3dd1b0"

    property int animationDuration: 200

    property var parentWindow

    implicitWidth: row.implicitWidth
    implicitHeight: root.parentHeight
    radius: height / 2.5

    // color: backColor
    color: "transparent"

    RowLayout {
        id: row

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        BluetoothPill {
            id: bluetooth_pill
            parentHeight: root.height
        }
        WifiPill {
            id: wifi_pill
            parentHeight: root.height
        }
        BatteryPill {
            id: bat_pill
            parentHeight: root.height
        }
        SystemTrayPill {
            id: tray_pill
            parentWindow: root.parentWindow
            parentHeight: root.height
        }
    }
}
