#Simple rot13 (en|de)coder
#To use, echo "secret text" | rot13 or echo "frperg grkg" | rot13
alias rot13='tr a-zA-Z n-za-mN-ZA-M'
#Get the unicode character from ~/Documents/Notes/Unicode.txt
alias unicode='ugrep -iQ $HOME/Documents/Notes/Unicode.txt | cut -d" " -f1 | tr -d "\n" | wl-copy'
