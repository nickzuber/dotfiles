# Create a directory and cd into it
function mkd {
  mkdir -p "$@" && cd "$_"
}

# fast & simple vim
function v {
  if [ $# -eq 0 ]; then
    vim .
  else
    vim "$@"
  fi
}

# clean screen restart
function cls {
	clear && reload
}

# cd into directory and display files
function cdl {
  cd "$@" && ls 
}

function google {
	/usr/bin/open -a "/Applications/Google Chrome.app" "https://duckduckgo.com/?q=${*}"
}

