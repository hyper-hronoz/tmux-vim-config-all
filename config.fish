if status is-interactive
    set -g theme_nerd_fonts yes
    set -g theme_display_date no
    fish_vi_key_bindings

    if status is-interactive
    and not set -q TMUX
        exec tmux
    end

    # set_color -b 000
end
