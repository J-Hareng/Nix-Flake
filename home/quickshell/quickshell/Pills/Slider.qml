import QtQuick

Rectangle {
    id: root

    // 0.0 - 1.0
    property real value: 0.5
    property color trackColor: "#0c1c1a"
    property color fillColor: "#3dd1b0"
    readonly property bool pressed: mouseArea.pressed

    // Fires continuously while dragging (and on click-to-jump).
    // Listen to this to actually apply the change somewhere.
    signal moved(real value)

    implicitHeight: 28
    radius: height / 2
    color: root.trackColor
    clip: true

    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
        width: (root.width - 10) * root.value
        height: parent.height / 1.5
        radius: height / 2
        color: root.fillColor

        // Only animate when the change came from outside (e.g. synced
        // from the real volume) — not while the user is dragging,
        // or it'll visibly lag behind the mouse.
        Behavior on width {
            enabled: !mouseArea.pressed
            NumberAnimation {
                duration: 120
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        function updateFromMouse(mx) {
            const v = Math.max(0, Math.min(1, mx / root.width));
            root.value = v;
            root.moved(v);
        }

        onPressed: mouse => updateFromMouse(mouse.x)
        onPositionChanged: mouse => {
            if (pressed)
                updateFromMouse(mouse.x);
        }
    }
}
