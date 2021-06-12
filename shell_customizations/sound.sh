#Add a beep command
if which paplay >/dev/null 2>&1; then
	alias beep='paplay /usr/share/sounds/freedesktop/stereo/bell.oga'
elif which aplay >/dev/null 2>&1; then
	alias beep='aaplay /usr/share/sounds/alsa/Noise.wav'
fi
