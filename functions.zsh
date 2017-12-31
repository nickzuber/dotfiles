
# Twitter forensics
function twitter {
	node ~/custom_scripts/twitter
}
function twt {
	node ~/custom_scripts/twitter
}

function c {
	code "$@"
}

function o {
	utop
}

# Current stock info
function stock {
	python ~/custom_scripts/stocks/stocks.py
}

# Custom version of `ls -a`
function cls {
	~/custom_scripts/l/stat
}

# Create a directory and cd into it
function mkd {
  mkdir -p "$@" && cd "$_"
}

# github shortcuts that I use frequently
function gcmt {
	# side note, just use `gcam` instead
	git commit -m "$@"
}

function gpm {
	git push origin master
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
function clr {
	clear && reload
}

# cd into directory and display files
function cdl {
  cd "$@" && ls 
}

function chrome {
	/usr/bin/open -a "/Applications/Google Chrome.app" "${*}"
}

function google {
	/usr/bin/open -a "/Applications/Google Chrome.app" "https://google.com/?q=${*}"
}

