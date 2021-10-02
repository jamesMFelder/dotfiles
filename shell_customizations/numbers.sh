#Put commas in big numbers (the rev command reverses the lines of it's input)
#And [[:digit:]] matches 0-9 (TODO: xdigit to match hexadacimal?)
alias ,="{ rev | sed 's/[[:digit:]][[:digit:]][[:digit:]]/&,/g' | rev; } <<< "
