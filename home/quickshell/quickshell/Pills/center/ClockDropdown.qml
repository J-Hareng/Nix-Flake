import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "../../src/"
import "./tabs/"

PanelWindow {
    id: overlay
    Shortcut {
        sequence: "Tab"
        enabled: DropdownState.expanded
        onActivated: DropdownState.nextTab()
    }
    Shortcut {
        sequence: "Shift+Tab"
        enabled: DropdownState.expanded
        onActivated: DropdownState.previousTab()
    }

    Shortcut {
        sequence: "Escape"
        enabled: DropdownState.expanded
        onActivated: {
            DropdownState.expanded = false;
            DropdownState.clearQuery();
        }
    }

    // property color bg: ""
    // property color text: ""
    property color prim: "#3dd1b0"
    focusable: true
    // Stay mapped through the closing animation, then unmap once it's
    // had time to finish — see hideTimer below.
    visible: DropdownState.expanded || hideTimer.running
    // visible: true
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.namespace: "quickshell:clock-dropdown"
    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    // While open, clicking anywhere outside the panel closes it.
    MouseArea {
        anchors.fill: parent
        onClicked: {
            DropdownState.expanded = false;
            DropdownState.clearQuery();
        }
    }

    Timer {
        id: hideTimer
        interval: 260
        repeat: false
    }

    Connections {
        target: DropdownState
        function onExpandedChanged() {
            if (!DropdownState.expanded)
                hideTimer.start();
        }
    }

    function getHight(): int {
        if (DropdownState.tab_state === DropdownState.State_tab.System_config) {
            return 350;
        } else if (DropdownState.tab_state === DropdownState.State_tab.App_louncher) {
            return 420;
        }
        return 480;
    }

    function getWidth(): int {
        if (DropdownState.tab_state === DropdownState.State_tab.System_config) {
            return 400;
        } else if (DropdownState.tab_state === DropdownState.State_tab.App_louncher) {
            return 500;
        }
        return 600;
    }
    Rectangle {
        id: panel
        anchors.horizontalCenter: parent.horizontalCenter
        // Matches the real pill's position in the bar exactly, so this
        // reads as the same element rather than a second one appearing.
        y: DropdownState.barTopMargin
        width: DropdownState.expanded ? getWidth() : (row.implicitWidth + 22)
        height: DropdownState.expanded ? getHight() : DropdownState.barHeight
        clip: true
        radius: DropdownState.expanded ? 16 : height / 2
        color: "#040e0d"

        Behavior on width {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }
        Behavior on height {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }
        Behavior on radius {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }

        // Swallow clicks on the panel itself so they don't fall through
        // to the outside-click MouseArea behind it.
        MouseArea {
            anchors.fill: parent
            onClicked: {}
        }

        // The "fake" clock — a duplicate of the real one in the bar,
        // landing exactly on top of it. Since this window renders on
        // the Overlay layer (above the bar's Top layer), it covers the
        // real pill precisely, so the swap is invisible to the eye.
        RowLayout {
            id: row
            anchors.top: parent.top
            anchors.topMargin: (DropdownState.barHeight - row.implicitHeight) / 2
            anchors.horizontalCenter: parent.horizontalCenter
            Clock {
                parentHeight: DropdownState.barHeight
                lable: poller.value

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: DropdownState.toggle()
                }
            }
        }

        RowLayout {
            id: row_tabs
            anchors.top: row.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: 16
            anchors.rightMargin: 16
            height: text.height
            spacing: 10

            opacity: DropdownState.expanded ? 1 : 0

            Behavior on opacity {
                NumberAnimation {
                    duration: 150
                }
            }

            Rectangle {
                Layout.fillWidth: true
                height: text.height + 4
                border.color: "#f5e2c5"
                radius: text.height / 3
                border.width: 1

                color: DropdownState.isState(DropdownState.State_tab.App_louncher) ? "#f5e2c5" : "#040e0d"
                // color: "#040e0d"

                Text {
                    id: text
                    anchors.centerIn: parent
                    text: "Apps"
                    color: DropdownState.isState(DropdownState.State_tab.App_louncher) ? "#040e0d" : "#f5e2c5"
                    font.family: "JetbrainsMono Nerd Font"
                    font.pixelSize: 14
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: DropdownState.setState(DropdownState.State_tab.App_louncher)
                }
            }
            Rectangle {
                Layout.fillWidth: true
                height: text.height + 4
                border.color: "#f5e2c5"
                color: DropdownState.isState(DropdownState.State_tab.Notifications) ? "#f5e2c5" : "#040e0d"
                radius: text.height / 3
                border.width: 1
                Text {
                    anchors.centerIn: parent
                    text: "Noti"
                    color: DropdownState.isState(DropdownState.State_tab.Notifications) ? "#040e0d" : "#f5e2c5"
                    font.family: "JetbrainsMono Nerd Font"
                    font.pixelSize: 14
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: DropdownState.setState(DropdownState.State_tab.Notifications)
                }
            }
            Rectangle {
                Layout.fillWidth: true
                height: text.height + 4
                border.color: "#f5e2c5"
                color: DropdownState.isState(DropdownState.State_tab.System_config) ? "#f5e2c5" : "#040e0d"
                radius: text.height / 3
                border.width: 1
                Text {
                    anchors.centerIn: parent
                    text: "Syst"
                    color: DropdownState.isState(DropdownState.State_tab.System_config) ? "#040e0d" : "#f5e2c5"
                    font.family: "JetbrainsMono Nerd Font"
                    font.pixelSize: 14
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: DropdownState.setState(DropdownState.State_tab.System_config)
                }
            }
        }

        RowLayout {
            anchors.top: row_tabs.bottom
            anchors.topMargin: 12
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 16
            opacity: DropdownState.expanded ? 1 : 0
            height: panel.height - row.height - row_tabs.height - row_tabs.height

            Behavior on opacity {
                NumberAnimation {
                    duration: 150
                }
            }

            Louncher {
                visible: DropdownState.isState(DropdownState.State_tab.App_louncher)
            }
            Notifications {
                visible: DropdownState.isState(DropdownState.State_tab.Notifications)
            }
            SystemConf {
                visible: DropdownState.isState(DropdownState.State_tab.System_config)
            }
        }
    }

    Poller {
        id: poller
        command: "date +%H:%M"
        interval: 60000
    }
}
