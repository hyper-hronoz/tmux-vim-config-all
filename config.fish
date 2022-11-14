if status is-interactive
    set -g fish_escape_delay_ms 10 
    set -g theme_nerd_fonts yes
    set -g theme_display_date no
    fish_vi_key_bindings

    if status is-interactive
    and not set -q TMUX
        exec tmux
    end

    # set_color -b 000

    set -l onedark_options '-b'

    if set -q VIM
        # Using from vim/neovim.
        set onedark_options "-256"
    else if string match -iq "eterm*" $TERM
        # Using from emacs.
        function fish_title; true; end
        set onedark_options "-256"
    end

    set_onedark $onedark_options

	fish_vi_key_bindings

	# Enable command history search via fzf.                                    
	function reverse_history_search                                    
	  history | fzf --no-sort | read -l command                                    
	  if test $command                                    
	    commandline -rb $command                                    
	  end                                    
	end                                    
					    
	function fish_user_key_bindings                                    
	  bind -M default / reverse_history_search                                    
	end      
end
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
