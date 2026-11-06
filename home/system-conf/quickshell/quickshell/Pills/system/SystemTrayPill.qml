import Quickshell
import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import Quickshell.Services.SystemTray

Rectangle {
    id: root

    property int parentHeight: 15
    property int iconSize: 16
    property int iconSpacing: 8

    property var parentWindow
    // visible: SystemTray.items.count > 0
    visible: true
    implicitWidth: visible ? row.implicitWidth + 22 : 0
    // implicitWidth: row.implicitWidth + 22
    implicitHeight: root.parentHeight
    radius: height / 2
    color: "#040e0d"

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: root.iconSpacing

        Repeater {
            model: SystemTray.items

            Item {
                id: trayIcon
                required property SystemTrayItem modelData
                implicitWidth: root.iconSize
                implicitHeight: root.iconSize

                Image {
                    anchors.fill: parent
                    source: trayIcon.modelData.icon
                    smooth: true
                    sourceSize: Qt.size(root.iconSize * 2, root.iconSize * 2)
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    cursorShape: Qt.PointingHandCursor
                    onClicked: mouse => {
                        const item = trayIcon.modelData;
                        const wantsMenu = mouse.button === Qt.RightButton || item.onlyMenu;
                        if (wantsMenu && item.hasMenu) {
                            const pos = trayIcon.mapToItem(root.Window.window.contentItem, mouse.x, mouse.y);
                            item.display(root.parentWindow, pos.x, pos.y);
                        } else {
                            item.activate();
                        }
                    }
                }
            }
        }
    }
}
