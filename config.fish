if status is-interactive
    set -g theme_nerd_fonts yes
    set -g theme_display_date no
    fish_vi_key_bindings
    # Commands to run in interactive sessions can go here
    if status is-interactive
    and not set -q TMUX
        exec tmux
    end

    # set_color -b 000
end
