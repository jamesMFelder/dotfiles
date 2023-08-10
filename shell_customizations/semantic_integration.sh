# Enable semantic integration of seperate output sections with the terminal emulator
# I only have it for bash now
if [ "$CURRENT_SHELL" = "bash" ]; then
	# It only works in xterm-derivatives, and breaks in neovim
	# Also, don't duplicate it
	if [[ -z "$NVIM" ]] && [[ "$TERM" =~ xterm ]] && [[ ! $PS1 =~ 133 ]]; then
		PS1='\[\e]133;L\a\]\[\e]133;D;$?\]\[\e]133;A\a\]'$PS1'\[\e]133;B\a\]' ;
		PS2='\[\e]133;A\a\]'$PS2'\[\e]133;B\a\]' ;
		PS0='\[\e]133;C\a\]' ;
	fi
fi
