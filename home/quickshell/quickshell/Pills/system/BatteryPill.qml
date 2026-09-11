import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

Rectangle {
    id: root
    property color iconColor: "#3dd1b0"
    property int maxLabelWidth: 400
    property int parentHeight: 15

    readonly property UPowerDevice battery: UPower.displayDevice
    readonly property int power: battery.ready ? battery.percentage * 100 : 0
    readonly property string label: battery.ready ? power + "% " : ""

    readonly property string bat1: "battery_android_frame_1"
    readonly property string bat2: "battery_android_frame_2"
    readonly property string bat3: "battery_android_frame_3"
    readonly property string bat4: "battery_android_frame_4"
    readonly property string bat5: "battery_android_frame_5"
    readonly property string batFull: "battery_android_frame_full"

    readonly property string batCharching_notFull: "battery_android_bolt"
    readonly property string batCharching_Full: "battery_android_frame_bolt"

    readonly property int animationDuration: 100

    readonly property bool hovered: mouseArea.containsMouse

    implicitWidth: row.implicitWidth + 22
    implicitHeight: root.parentHeight
    radius: height / 2
    color: "#040e0d"

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 0

        Text {
            id: lable
            text: root.label
            color: "#f5e2c5"
            font.family: "JetbrainsMono Nerd Font"
            font.pixelSize: 14
            clip: true
            // visible: root.hovered

            opacity: root.hovered ? 1 : 0
            Layout.maximumWidth: root.hovered ? implicitWidth : 0

            Behavior on opacity {
                NumberAnimation {
                    duration: root.animationDuration
                }
            }

            Behavior on Layout.maximumWidth {
                NumberAnimation {
                    duration: root.animationDuration
                    easing.type: Easing.Bezier
                    easing.bezierCurve: [0.42, 0, 0.58, 1, 1, 1]  // same as CSS cubic-bezier(0.42,0,0.58,1)
                }
            }
        }
        Text {
            text: root.getBatIcon(root.power, root.battery.state)
            color: root.iconColor
            font.family: "Material Symbols Rounded"
            font.pixelSize: 18
        }
    }

    function getBatIcon(battery_percentage: int, battery_state: int): string {
        if (battery_state == 1) {
            if (battery_percentage > 80)
                return batCharching_Full;
            else {
                return batCharching_notFull;
            }
        } else {
            if (battery_percentage > 90)
                return batFull;
            else if (battery_percentage > 70)
                return bat5;
            else if (battery_percentage > 60)
                return bat4;
            else if (battery_percentage > 30)
                return bat3;
            else if (battery_percentage > 10)
                return bat2;
            else
                return bat1;
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
