import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../../src/"

Rectangle {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    color: "transparent"

    // property color bg: ""
    // property color text: ""
    // property color prim: "#3dd1b0"

    // property string query: ""

    ScriptModel {
        id: filtered
        values: {
            const all = [...DesktopEntries.applications.values].filter(e => e.name).sort((a, b) => a.name.localeCompare(b.name));
            const q = DropdownState.query.trim().toLowerCase();
            if (q === "")
                return all;
            return all.filter(e => {
                const name = (e.name || "").toLowerCase();
                const comment = (e.comment || "").toLowerCase();
                return name.includes(q) || comment.includes(q);
            });
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        // Search bar
        Rectangle {
            Layout.fillWidth: true
            height: 34
            radius: 10
            color: "#0c1c1a"
            border.color: input.activeFocus ? root.prim : "transparent"
            border.width: 1

            Text {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 10
                text: "Search apps…"
                color: "#7a8f8c"
                font.family: "JetbrainsMono Nerd Font"
                font.pixelSize: 14
                visible: input.text.length === 0
            }

            TextInput {
                id: input
                anchors.fill: parent
                anchors.margins: 8
                verticalAlignment: TextInput.AlignVCenter
                color: "#f5e2c5"
                font.family: "JetbrainsMono Nerd Font"
                font.pixelSize: 14
                focus: true

                onTextChanged: {
                    DropdownState.query = text;
                    list.currentIndex = 0;
                }

                Keys.onUpPressed: list.currentIndex = Math.max(0, list.currentIndex - 1)
                Keys.onDownPressed: list.currentIndex = Math.min(filtered.values.length - 1, list.currentIndex + 1)

                Keys.onEscapePressed: {
                    text = "";
                    DropdownState.expanded = false;
                }
                Keys.onReturnPressed: {
                    if (list.currentIndex >= 0 && list.currentIndex < filtered.values.length) {
                        filtered.values[list.currentIndex].execute();
                        DropdownState.expanded = false;
                    }
                }
            }
        }

        // Results
        ListView {
            id: list
            currentIndex: 0
            onCurrentIndexChanged: positionViewAtIndex(currentIndex, ListView.Contain)
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 2
            model: filtered

            delegate: Rectangle {
                id: delegateRoot
                required property var modelData
                required property int index
                width: list.width
                height: 36
                radius: 8
                color: index === list.currentIndex ? "#0c1c1a" : "transparent"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 6
                    spacing: 10

                    Image {
                        source: delegateRoot.modelData.icon ? Quickshell.iconPath(delegateRoot.modelData.icon) : ""
                        Layout.preferredWidth: 22
                        Layout.preferredHeight: 22
                        smooth: true
                    }

                    Text {
                        text: delegateRoot.modelData.name
                        color: "#f5e2c5"
                        font.family: "JetbrainsMono Nerd Font"
                        font.pixelSize: 13
                        elide: Text.ElideRight
                        Layout.fillWidth: true
                    }
                }

                MouseArea {
                    id: hoverArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onEntered: list.currentIndex = delegateRoot.index
                    onClicked: {
                        delegateRoot.modelData.execute();
                        DropdownState.expanded = false;
                    }
                }
            }
        }
    }
}
