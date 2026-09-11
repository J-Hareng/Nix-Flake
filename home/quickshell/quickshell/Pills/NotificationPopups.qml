import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "../src/"

PanelWindow {
    id: overlay

    visible: NotificationService.popups.length > 0
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.namespace: "quickshell:notification-popups"

    anchors {
        top: true
        right: true
    }
    margins.top: DropdownState.barHeight + 8
    implicitWidth: 400
    implicitHeight: column.implicitHeight

    Column {
        id: column
        width: parent.width
        spacing: 8

        add: Transition {
            NumberAnimation {
                properties: "x"
                from: +column.width
                duration: 200
                easing.type: Easing.OutCubic
            }
            NumberAnimation {
                properties: "y"
                from: -100
                duration: 200
                easing.type: Easing.OutCubic
            }
        }

        Repeater {
            model: ScriptModel {
                values: NotificationService.popups
                objectProp: "id"
            }

            Rectangle {
                id: toast
                required property var modelData
                width: column.width
                implicitHeight: content.implicitHeight + 20
                radius: 12
                color: "#040e0d"
                opacity: 1
                border.color: "#0da180"
                border.width: 1

                RowLayout {
                    id: content
                    anchors.fill: parent
                    anchors.margins: 10
                    spacing: 10

                    Image {
                        source: toast.modelData.image || (toast.modelData.appIcon ? Quickshell.iconPath(toast.modelData.appIcon) : "")
                        visible: source !== ""
                        Layout.preferredWidth: 32
                        Layout.preferredHeight: 32
                        Layout.alignment: Qt.AlignTop
                        smooth: true
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 4

                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 8

                            Text {
                                text: toast.modelData.summary
                                color: "#f5e2c5"
                                font.family: "JetbrainsMono Nerd Font"
                                font.pixelSize: 14
                                font.bold: true
                                wrapMode: Text.Wrap
                                Layout.fillWidth: true
                            }
                            Text {
                                text: toast.modelData.appName
                                color: "#3dd1b0"
                                font.family: "JetbrainsMono Nerd Font"
                                font.pixelSize: 11
                            }
                        }

                        Text {
                            visible: text.length > 0
                            text: toast.modelData.body
                            textFormat: Text.PlainText
                            color: "#c9b89a"
                            font.family: "JetbrainsMono Nerd Font"
                            font.pixelSize: 12
                            wrapMode: Text.Wrap
                            Layout.fillWidth: true
                        }
                    }
                }

                Timer {
                    running: NotificationService.timeoutFor(toast.modelData) > 0
                    interval: NotificationService.timeoutFor(toast.modelData)
                    onTriggered: NotificationService.expirePopup(toast.modelData)
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: NotificationService.expirePopup(toast.modelData)
                }
            }
        }
    }
}
