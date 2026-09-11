import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../../src/"

Rectangle {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "transparent"

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        RowLayout {
            Layout.fillWidth: true

            Text {
                text: "Notifications"
                color: "#f5e2c5"
                font.family: "JetbrainsMono Nerd Font"
                font.pixelSize: 14
                font.bold: true
                Layout.fillWidth: true
            }

            Text {
                visible: NotificationService.history.length > 0
                text: "Clear all"
                color: "#3dd1b0"
                font.family: "JetbrainsMono Nerd Font"
                font.pixelSize: 12

                MouseArea {
                    anchors.fill: parent
                    anchors.margins: -6
                    cursorShape: Qt.PointingHandCursor
                    onClicked: NotificationService.clearHistory()
                }
            }
        }

        Text {
            visible: NotificationService.history.length === 0
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 30
            text: "No notifications yet"
            color: "#7a8f8c"
            font.family: "JetbrainsMono Nerd Font"
            font.pixelSize: 13
        }

        ListView {
            id: list
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 8
            model: ScriptModel {
                values: NotificationService.history
                objectProp: "id"
            }

            delegate: Rectangle {
                id: card
                required property var modelData
                width: list.width
                height: contentCol.height + 20
                radius: 12
                color: "#0c1c1a"

                Image {
                    id: icon
                    source: card.modelData.image || (card.modelData.appIcon ? Quickshell.iconPath(card.modelData.appIcon) : "")
                    visible: source !== ""
                    width: visible ? 28 : 0
                    height: 28
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: 10
                    smooth: true
                }

                Text {
                    id: closeBtn
                    text: "✕"
                    color: "#7a8f8c"
                    font.pixelSize: 12
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.margins: 10

                    MouseArea {
                        anchors.fill: parent
                        anchors.margins: -6
                        cursorShape: Qt.PointingHandCursor
                        onClicked: NotificationService.dismiss(card.modelData)
                    }
                }

                Column {
                    id: contentCol
                    anchors.left: icon.right
                    anchors.right: closeBtn.left
                    anchors.top: parent.top
                    anchors.leftMargin: 10
                    anchors.rightMargin: 10
                    anchors.topMargin: 10
                    spacing: 4

                    Row {
                        width: parent.width
                        spacing: 8

                        Text {
                            id: summaryText
                            width: parent.width - appNameText.implicitWidth - 8
                            text: card.modelData.summary
                            color: "#f5e2c5"
                            font.family: "JetbrainsMono Nerd Font"
                            font.pixelSize: 13
                            font.bold: true
                            wrapMode: Text.Wrap
                        }
                        Text {
                            id: appNameText
                            text: card.modelData.appName
                            color: "#3dd1b0"
                            font.family: "JetbrainsMono Nerd Font"
                            font.pixelSize: 10
                        }
                    }

                    Text {
                        visible: text.length > 0
                        width: parent.width
                        text: card.modelData.body
                        textFormat: Text.PlainText
                        color: "#c9b89a"
                        font.family: "JetbrainsMono Nerd Font"
                        font.pixelSize: 11
                        wrapMode: Text.Wrap
                    }
                }
            }
        }
    }
}
