# af-magic.zsh-theme
# Repo: https://github.com/andyfleming/oh-my-zsh
# Direct Link: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

POSTEDIT=$'\e[0m'

# primary prompt
PROMPT=\
'$fg[default]%m:%~\
$(git_prompt_info)\
$fg[blue]%(!.#.)%{$reset_color%} %n$> '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# right prompt
# -- this doesn't align properly so it looks dumb

# if type "virtualenv_prompt_info" > /dev/null
# then
# 	RPROMPT='$(virtualenv_prompt_info)$my_gray%n@%m%{$reset_color%}%'
# else
# 	RPROMPT='$my_gray%n@%m%{$reset_color%}%'
# fi

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" $fg[green]"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green] ✓$reset_color"	# ✔
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red] ✖$reset_color"  	# ✗
ZSH_THEME_GIT_PROMPT_SUFFIX=""
