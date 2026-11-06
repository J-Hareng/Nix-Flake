import Quickshell
import QtQuick
import QtQuick.Layouts
import "../../src/"

Rectangle {
    id: root
    property int parentHeight: 15
    implicitWidth: row.implicitWidth + 22
    implicitHeight: root.parentHeight
    color: "#040e0d"
    radius: height / 2

    RowLayout {
        id: row
        anchors.centerIn: parent
        Clock {
            parentHeight: root.parentHeight
            lable: clock.value
        }
    }

    Poller {
        id: clock
        command: "date +%H:%M"
        interval: 60000
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: DropdownState.toggle()
    }
}
