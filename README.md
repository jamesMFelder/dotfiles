#  dotfiles
### Things you should have for this to work automatically
- Bash
- GCC
- GNU Coreutils
- Python3
- Awk

### Optional
- uxterm (for uxterm\_night)
- rofi-1pass (Archlinux) (for 1password)
- flatpak, pacman, yay (aur helper) (for checkupdates)
- pulseaudio (override beep command)
- alsa (override beep command)

### Commands I provide usefull aliases for
- cflow (callgraph\_project finds all the c and c++ files and pipes them to this command)
- ddgr (-x to expand urls)
- git (gac to auto add and commit)
- ls (l, la, ll, lla {extra l:--long, la:--almost-all, lla:--all})
- sl (-a:calls for help, -l:small train, -F:it flies, -e:interrupt with ^C)
- iftop (alias for calling it on my laptop's wifi card)
- op (signin allows rofi-1pass to run, pat gets my login for Github)
- tldr (autocomplete)
- tree (color)
- neovim (vi=nvim, vim=nvim, view=nvim read only, :q=exit, MANPAGER=nvim +Man!)

### Programs
- 1pass: shows 1password with rofi
- ansi\_colors: shows some common escape sequences for changing the color
- areUpdates: checks with pacman, yay and flatpak for updates
- ascii\_table: prints the raw ascii characters in a table
- sizes: shows the sizes of various types in c on the machine
- stt/tts: converts all spaces to tabs or vis-versa for each argument
- sys\_info\_page: outptuts a html status report to the specified file
- uxterm\_night: starts uxterm with a dark background in the evening/night

### Other stuff
- $CURRENT\_SHELL (from /proc)
- autocd (typing a directory cds there)
- cd-ing to non-existent directory will try going to a subdirectory in ~/src
- source command-not-found files (if installed)
- disk\_space (lsblk only with info on size, available...)
- ros and cros (grep for word in dictionaries) (cROSword and Column cROSword)
- explore (open current directory in file manager)
- rpi\_rev (show Raspberry Pi version
- find\_hang (requires systemd, list services in critical-chain that were slow)
- screen\_splash (run from tty, fills it with random colors)
- gui (calls find\_hang -d, screen\_splash and startx)
- turns off ^S and ^Q blocking/restoring output
- zoom\_meeting\_info (returns meeting id + password from link(s) on stdin)
