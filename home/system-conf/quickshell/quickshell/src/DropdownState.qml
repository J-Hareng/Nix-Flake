pragma Singleton
import Quickshell

Singleton {
    property bool expanded: false

    enum State_tab {
        App_louncher,
        Notifications,
        System_config
    }

    // Shared layout constants so the bar and the dropdown overlay
    // always agree on exactly where the real pill sits.
    //   property State_tab tab_state: State_tab.App_louncher
    property int barTopMargin: 3
    property int barContentHeight: 20
    // property int tab_state: State_tab.App_louncher
    property int tab_state: DropdownState.State_tab.App_launcher
    property string query: ""

    readonly property int barHeight: barContentHeight + barTopMargin

    function clearQuery(): void {
        this.query = "";
    }

    function nextTab(): void {
        tab_state = (tab_state + 1) % 3;
        clearQuery();
    }
    function previousTab(): void {
        tab_state = (tab_state - 1 + 3) % 3;
        clearQuery();
    }
    function toggle(): void {
        expanded = !expanded;
        clearQuery();
    }
    function isState(state: int): bool {
        return state === tab_state;
    }
    function setState(state: int): void {
        tab_state = state;
        clearQuery();
    }
}
