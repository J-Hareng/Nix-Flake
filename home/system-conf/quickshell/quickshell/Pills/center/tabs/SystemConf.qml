import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../../src/"
import "../../"

Rectangle {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "transparent"
    ColumnLayout {

        anchors.left: parent.left
        anchors.right: parent.right
        RowLayout {
            anchors.left: parent.left
            anchors.right: parent.right
            // anchors.verticalCenter: parent.verticalCenter
            spacing: 10

            Text {
                text: VolumeService.muted ? "volume_off" : "volume_up"  // material glyphs — fill in once you've got the icon set
                color: "#f5e2c5"
                font.family: "Material Symbols Rounded"
                font.pixelSize: 18

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: VolumeService.toggleMute()
                }
            }

            Slider {
                id: volumeSlider
                Layout.fillWidth: true
                value: VolumeService.volume
                onMoved: v => VolumeService.setVolume(v)

                Component.onCompleted: value = VolumeService.volume

                Connections {
                    target: VolumeService
                    function onVolumeChanged() {
                        if (!volumeSlider.pressed)
                            volumeSlider.value = VolumeService.volume;
                    }
                }
            }
        }
        Poller {
            id: brightnessPoller
            command: "brightnessctl -m | cut -d, -f4 | tr -d '%'"
            interval: 2000
        }

        RowLayout {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 10

            Text {
                text: "brightness_6"  // material glyph — swap once you've got the icon set wired up
                color: "#f5e2c5"
                font.family: "Material Symbols Rounded"
                font.pixelSize: 18
            }

            Slider {
                id: brightnessSlider
                Layout.fillWidth: true
                onMoved: v => Quickshell.execDetached(["brightnessctl", "set", Math.round(v * 100) + "%"])

                Component.onCompleted: value = brightnessPoller.value / 100

                Connections {
                    target: brightnessPoller
                    function onValueChanged() {
                        if (!brightnessSlider.pressed)
                            brightnessSlider.value = brightnessPoller.value / 100;
                    }
                }
            }
        }
        Poller {
            id: tempPoller
            command: "sunsetr get static_temp"
            interval: 2000
        }

        RowLayout {
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 10

            Text {
                text: "thermostat"  // material glyph placeholder
                color: "#f5e2c5"
                font.family: "Material Symbols Rounded"
                font.pixelSize: 18
            }

            Slider {
                id: tempSlider
                Layout.fillWidth: true

                readonly property int minTemp: 5000
                readonly property int maxTemp: 7500

                onMoved: applyTimer.restart()

                Timer {
                    id: applyTimer
                    interval: 150
                    onTriggered: {
                        const temp = Math.round(tempSlider.minTemp + tempSlider.value * (tempSlider.maxTemp - tempSlider.minTemp));
                        Quickshell.execDetached(["sunsetr", "set", "static_temp=" + temp]);
                    }
                }

                function syncFromPoller() {
                    const temp = parseInt(tempPoller.value);
                    if (!isNaN(temp))
                        value = Math.max(0, Math.min(1, (temp - minTemp) / (maxTemp - minTemp)));
                }

                Component.onCompleted: syncFromPoller()

                Connections {
                    target: tempPoller
                    function onValueChanged() {
                        if (!tempSlider.pressed)
                            tempSlider.syncFromPoller();
                    }
                }
            }
        }
        Rectangle {
            height: 1
        }
        PowerProfiles {}
        Rectangle {
            height: 0
        }
        RowLayout {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 5
            anchors.rightMargin: 5
            spacing: 15
            Rectangle {
                Layout.fillWidth: true
                height: micText.height + 20
                radius: height / 3
                border.width: 1
                border.color: VolumeService.micMuted ? "#3dd1b0" : "#1d3631"
                color: VolumeService.micMuted ? "#3dd1b0" : "#0a1816"

                Text {
                    id: micText
                    anchors.centerIn: parent
                    text: VolumeService.micMuted ? "mic_off" : "mic"
                    color: VolumeService.micMuted ? "#040e0d" : "#7ad9a8"
                    font.family: "Material Symbols Rounded"
                    font.pixelSize: 25
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: VolumeService.toggleMicMute()
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: dndText.height + 20
                radius: height / 3
                border.width: 1
                border.color: NotificationService.doNotDisturb ? "#3dd1b0" : "#1d3631"
                color: NotificationService.doNotDisturb ? "#3dd1b0" : "#0a1816"

                Text {
                    id: dndText
                    anchors.centerIn: parent
                    text: NotificationService.doNotDisturb ? "notifications_off" : "notifications"
                    color: NotificationService.doNotDisturb ? "#040e0d" : "#7ad9a8"
                    font.family: "Material Symbols Rounded"
                    font.pixelSize: 25
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: NotificationService.toggleDnd()
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: rotate.height + 20
                radius: height / 3
                border.width: 1
                border.color: "#1d3631"
                color: "#0a1816"

                Text {
                    id: rotate
                    anchors.centerIn: parent
                    text: "screen_rotation_up"
                    color: "#7ad9a8"
                    font.family: "Material Symbols Rounded"
                    font.pixelSize: 25
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    // onClicked: NotificationService.toggleDnd()
                }
            }
        }
    }
    SystemMng {}
}
