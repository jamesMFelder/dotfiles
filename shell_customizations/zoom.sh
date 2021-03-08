#Get meeting id and password from a link (usefull b/c firefox doesn't want to launch zoom in a firejail).
alias zoom_meeting_info='sed -e '\''s/?pwd=/\n/'\'' -e '\''1s@https://.*zoom.us/j/@@'\'''
