pragma Singleton
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root

    property var popups: []
    property var history: []

    property bool doNotDisturb: false

    function snapshot(notif) {
        return {
            id: notif.id,
            appName: notif.appName,
            summary: notif.summary,
            body: notif.body,
            image: notif.image,
            appIcon: notif.appIcon,
            urgency: notif.urgency,
            expireTimeout: notif.expireTimeout,
            _notif: notif
        };
    }

    function toggleDnd(): void {
        root.doNotDisturb = !root.doNotDisturb;
    }

    function timeoutFor(entry) {
        if (entry.urgency === NotificationUrgency.Critical)
            return -1;
        if (entry.expireTimeout && entry.expireTimeout > 0)
            return entry.expireTimeout * 1000;
        if (entry.urgency === NotificationUrgency.Low)
            return 4000;
        return 7000;
    }

    function expirePopup(entry) {
        root.popups = root.popups.filter(e => e.id !== entry.id);
    }

    function dismiss(entry) {
        if (entry._notif)
            entry._notif.tracked = false;
        root.popups = root.popups.filter(e => e.id !== entry.id);
        root.history = root.history.filter(e => e.id !== entry.id);
    }

    function clearHistory() {
        root.history = [];
    }

    readonly property NotificationServer server: NotificationServer {
        keepOnReload: false
        actionsSupported: true
        bodySupported: true
        bodyMarkupSupported: true
        bodyHyperlinksSupported: true
        imageSupported: true
        bodyImagesSupported: true
        persistenceSupported: true

        onNotification: notif => {
            notif.tracked = true;
            const entry = root.snapshot(notif);
            if (!root.doNotDisturb)
                root.popups = [entry, ...root.popups.filter(e => e.id !== entry.id)];
            if (!notif.transient)
                root.history = [entry, ...root.history.filter(e => e.id !== entry.id)];
        }
    }
}
