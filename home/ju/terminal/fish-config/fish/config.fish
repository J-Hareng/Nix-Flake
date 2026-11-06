if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source

    set -Ux EDITOR nvim

    fish_config theme choose Ariadne

    fish_vi_key_bindings
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore

    # Start Hyprland on TTY1 login
    # if status is-login
    #     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    #         exec Hyprland
    #     end
    # end

    # /bin/bash /home/ju/scripts/StartTmux.sh

    function fish_user_key_bindings
        bind -M visual y 'fish_clipboard_copy; commandline -f end-selection repaint-mode'
        bind -M visual x 'fish_clipboard_cut; commandline -f end-selection repaint-mode'
    end
end

# set -x LS_COLORS (vivid generate carbonfox)
