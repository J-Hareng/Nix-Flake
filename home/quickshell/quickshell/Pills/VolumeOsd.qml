import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "../src/"

PanelWindow {
    id: overlay

    visible: hideTimer.running
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.namespace: "quickshell:volume-osd"

    anchors {
        bottom: true
        left: true
        right: true
    }
    implicitHeight: 90

    Timer {
        id: hideTimer
        interval: 1500
        repeat: false
    }

    Connections {
        target: VolumeService
        function onVolumeChanged() {
            hideTimer.restart();
        }
        function onMutedChanged() {
            hideTimer.restart();
        }
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        width: 220
        height: 50
        radius: 16
        color: "#040e0d"
        border.color: "#1d3631"
        border.width: 1

        RowLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 10

            Text {
                text: VolumeService.muted ? "volume_off" : "volume_up"
                font.family: "Material Symbols Rounded"
                font.pixelSize: 18
                color: "#f5e2c5"
            }

            Rectangle {
                Layout.fillWidth: true
                height: 8
                radius: 4
                color: "#0c1c1a"

                Rectangle {
                    width: parent.width * (VolumeService.muted ? 0 : VolumeService.volume)
                    height: parent.height
                    radius: parent.radius
                    color: "#3dd1b0"

                    Behavior on width {
                        NumberAnimation { duration: 120 }
                    }
                }
            }
        }
    }
}
