import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "../src/"

PanelWindow {
    id: overlay

    property bool shown: false
    visible: shown || closeAnimTimer.running

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

    onShownChanged: {
        if (!shown)
            closeAnimTimer.restart();
    }

    Timer {
        id: hideTimer
        interval: 1500
        repeat: false
        onTriggered: overlay.shown = false
    }

    Timer {
        id: closeAnimTimer
        interval: 200
        repeat: false
    }

    Connections {
        target: VolumeService
        function onVolumeChanged() {
            overlay.shown = true;
            hideTimer.restart();
        }
        function onMutedChanged() {
            overlay.shown = true;
            hideTimer.restart();
        }
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 40
        height: 50
        radius: 16
        color: "#040e0d"
        border.color: "#1d3631"
        border.width: 1

        width: overlay.shown ? 220 : 50
        opacity: overlay.shown ? 1 : 0
        scale: overlay.shown ? 1 : 0.85

        transformOrigin: Item.Bottom

        Behavior on width {
            NumberAnimation {
                duration: 180
                easing.type: Easing.OutCubic
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: 180
                easing.type: Easing.OutCubic
            }
        }
        Behavior on scale {
            NumberAnimation {
                duration: 180
                easing.type: Easing.OutCubic
            }
        }

        RowLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 10

            Text {
                text: VolumeService.muted ? "volume_off" : "volume_up"
                font.family: "Material Symbols Rounded"
                font.pixelSize: 18
                color: "#f5e2c5"
                opacity: overlay.shown ? 1 : 0
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
                }
            }
        }
    }
}
