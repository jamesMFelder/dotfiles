alias view_lib="ls /lib /usr/lib /usr/local/lib | sed '/*:/d' | sed 's/lib//' | sed 's/.so//' | sed 's/.a//' | column"
