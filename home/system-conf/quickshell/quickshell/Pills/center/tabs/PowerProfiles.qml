import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

RowLayout {
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.leftMargin: 5
    anchors.rightMargin: 5
    spacing: 15

    Rectangle {
        Layout.fillWidth: true
        height: ecoText.height + 20
        radius: height / 3
        border.width: 1
        border.color: PowerProfiles.profile === PowerProfile.PowerSaver ? "#3dd1b0" : "#1d3631"
        color: PowerProfiles.profile === PowerProfile.PowerSaver ? "#3dd1b0" : "#0a1816"

        Text {
            id: ecoText
            anchors.centerIn: parent
            text: "eco"
            color: PowerProfiles.profile === PowerProfile.PowerSaver ? "#040e0d" : "#7ad9a8"
            font.family: "Material Symbols Rounded"
            font.pixelSize: 25
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: PowerProfiles.profile = PowerProfile.PowerSaver
        }
    }

    Rectangle {
        Layout.fillWidth: true
        height: balancedText.height + 20
        radius: height / 3
        border.width: 1
        border.color: PowerProfiles.profile === PowerProfile.Balanced ? "#3dd1b0" : "#1d3631"
        color: PowerProfiles.profile === PowerProfile.Balanced ? "#3dd1b0" : "#0a1816"

        Text {
            id: balancedText
            anchors.centerIn: parent
            text: "balance"
            color: PowerProfiles.profile === PowerProfile.Balanced ? "#040e0d" : "#7ad9a8"
            font.family: "Material Symbols Rounded"
            font.pixelSize: 25
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: PowerProfiles.profile = PowerProfile.Balanced
        }
    }

    Rectangle {
        Layout.fillWidth: true
        visible: PowerProfiles.hasPerformanceProfile
        height: perfText.height + 20
        radius: height / 3
        border.width: 1
        border.color: PowerProfiles.profile === PowerProfile.Performance ? "#3dd1b0" : "#1d3631"
        color: PowerProfiles.profile === PowerProfile.Performance ? "#3dd1b0" : "#0a1816"

        Text {
            id: perfText
            anchors.centerIn: parent
            text: "speed"
            color: PowerProfiles.profile === PowerProfile.Performance ? "#040e0d" : "#7ad9a8"
            font.family: "Material Symbols Rounded"
            font.pixelSize: 25
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: PowerProfiles.profile = PowerProfile.Performance
        }
    }
}
