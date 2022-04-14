# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

if [ $UID -eq 0 ]; then NCOLOFG"009"; else NCOLOR="010"; fi
local return_code="%(?..%{$FG[009]%}%? ↵%{$reset_color%})"

POSTEDIT=$'\e[0m'

function node_version() {
  echo "⏣ $(node -v)"
}

function current_directory() {
  echo "ƒ %~"
}

function git_repository_name() {
  echo "$FG[001]$(git config --local remote.origin.url|sed -n 's#.*/\([^.]*\)\.git#\1#p')"
}

function git_branch() {
  GIT_MESSAGE=$(git_prompt_info)
  GIT_LENGTH=${#GIT_MESSAGE}
  if [[ "GIT_LENGTH" -ne "0" ]]; then
    echo "%B$(git_repository_name)%b  $(git_prompt_info)"
  fi
}

# primary prompt
PROMPT=\
'$FG[240]$(current_directory) \
 $FG[240]$(git_branch)\
$fg[blue]%(!.#.)%{$reset_color%}
$ '
PROMPT2='%{$FG[009]%}\ %{$reset_color%}'
RPS1='${return_code}'
RPROMPT='$FG[240] $(node_version)%{$reset_color%}%'

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[002]"
ZSH_THEME_GIT_PROMPT_CLEAN="$FG[010] ✓$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[009] ✖$reset_color"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
