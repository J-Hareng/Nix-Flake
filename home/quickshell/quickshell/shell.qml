//@ pragma UseQApplication
import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "./Pills/hypr/"
import "./Pills/system/"
import "./Pills/center/"
import "./Pills/"
import "./src/"

ShellRoot {

    IpcHandler {
        target: "dropdown"
        function toggle(): void {
            DropdownState.setState(DropdownState.State_tab.App_louncher);
            DropdownState.toggle();
        }
    }
    ClockDropdown {}
    NotificationPopups {}

    PanelWindow {
        id: bar
        property int margin_top: 3
        property int barHight: 20
        anchors {
            top: true
            left: true
            right: true
        }

        margins.top: margin_top
        implicitHeight: barHight + margin_top
        color: "transparent"

        Poller {
            id: clock
            command: "date +%H:%M"
            interval: 60000
        }
        RowLayout {
            id: row_left
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 5
            spacing: 8
            HyprlandPill {
                parentHeight: bar.height
            }
        }
        RowLayout {
            id: row_center
            anchors.centerIn: parent
            CenterPill {
                parentHeight: bar.height
            }
        }

        RowLayout {
            id: row_right
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 5
            spacing: 8
            RightPill {
                parentWindow: bar
                parentHeight: bar.height
            }
        }
    }
}
