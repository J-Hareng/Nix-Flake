pragma Singleton
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property PwNode source: Pipewire.defaultAudioSource

    property real volume: sink?.audio ? sink.audio.volume : 0
    property bool muted: sink?.audio ? sink.audio.muted : false
    property bool micMuted: source?.audio ? source.audio.muted : false

    function setVolume(v: real): void {
        if (sink?.ready && sink?.audio) {
            sink.audio.muted = false;
            sink.audio.volume = v;
        }
    }

    function toggleMute(): void {
        if (sink?.ready && sink?.audio)
            sink.audio.muted = !sink.audio.muted;
    }

    function toggleMicMute(): void {
        if (source?.ready && source?.audio)
            source.audio.muted = !source.audio.muted;
    }

    // Required for the nodes' properties to actually be live/usable.
    PwObjectTracker {
        objects: [root.sink, root.source]
    }
}
