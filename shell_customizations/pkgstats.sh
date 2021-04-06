#Get stats about the most popular package on archlinux:
alias stats="curl -s 'https://pkgstats.archlinux.de/api/packages/php' | tr ',' '\n'; echo"
