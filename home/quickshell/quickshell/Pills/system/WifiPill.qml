import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "../../src/"
import "../../Pills/"

Rectangle {
    id: root

    // Change this to match your wifi device (check with `iwctl device list`)
    property string interfaceName: "wlan0"
    // How often to re-check link status, in ms
    property int pollInterval: 5000

    readonly property string wifi1: "network_wifi_1_bar"
    readonly property string wifi2: "network_wifi_2_bar"
    readonly property string wifi3: "network_wifi_3_bar"
    readonly property string wifi4: "signal_wifi_4_bar"
    readonly property string wifi_off: "signal_wifi_off"
    readonly property string wifi_bad: "signal_wifi_bad"

    property bool connected: false
    property string ssid: ""
    property int signalDbm: -100

    property string icon: wifi_off
    property string lable: ""
    property color iconColor: "#3dd1b0"
    property int maxLableWidth: 400
    property int parentHeight: 15

    readonly property int animationDuration: 100

    readonly property bool hovered: mouseArea.containsMouse

    implicitWidth: row.implicitWidth + 22
    implicitHeight: root.parentHeight
    radius: height / 2
    color: "#040e0d"

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: Quickshell.execDetached(["ghostty", "--class=quickshell.wifipopup", "-e", "impala"])
    }

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 0
        Text {
            id: lable
            text: root.ssid + " "
            color: "#f5e2c5"
            font.family: "JetbrainsMono Nerd Font"
            font.pixelSize: 14
            clip: true

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
            text: root.icon
            color: root.iconColor
            font.family: "Material Symbols Rounded"
            font.pixelSize: 14
        }
    }

    function updateIcon() {
        if (!root.connected) {
            root.icon = root.wifi_off;
            root.lable = "";
            return;
        }
        root.lable = root.ssid;
        if (root.signalDbm >= -50)
            root.icon = root.wifi4;
        else if (root.signalDbm >= -60)
            root.icon = root.wifi3;
        else if (root.signalDbm >= -70)
            root.icon = root.wifi2;
        else if (root.signalDbm >= -80)
            root.icon = root.wifi1;
        else
            root.icon = root.wifi_bad;
    }

    Process {
        id: linkProc
        command: ["iw", "dev", root.interfaceName, "link"]
        stdout: StdioCollector {
            onStreamFinished: {
                const out = this.text;
                if (out.indexOf("Not connected") !== -1 || out.trim() === "") {
                    root.connected = false;
                    root.updateIcon();
                    return;
                }
                const ssidMatch = out.match(/SSID:\s*(.+)/);
                const sigMatch = out.match(/signal:\s*(-?\d+)\s*dBm/);
                root.connected = true;
                root.ssid = ssidMatch ? ssidMatch[1].trim() : "";
                root.signalDbm = sigMatch ? parseInt(sigMatch[1], 10) : -100;
                root.updateIcon();
            }
        }
    }

    Timer {
        interval: root.pollInterval
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: linkProc.running = true
    }
}
