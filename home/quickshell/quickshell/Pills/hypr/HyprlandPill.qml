import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Rectangle {
    id: root

    property int parentHeight: 15

    implicitWidth: row.implicitWidth + 22
    implicitHeight: root.parentHeight

    color: "transparent"

    RowLayout {
        id: row
        anchors.left: parent.left
        spacing: 5
        Repeater {
            id: rep
            model: 10

            Workspace {
                property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
                workspace: ws
                ws_index: index + 1
                isActive: Hyprland.focusedWorkspace?.id === (index + 1)

                parentHeight: root.parentHeight
            }
        }
    }
}
