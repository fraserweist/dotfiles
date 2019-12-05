RESET="\[\033[00m\]"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
user_section="$(color style:bold,fg:light_grey,bg:green) \u "
dir_section="$(color style:bold,fg:light_grey,bg:blue) \w "
git_section="$(color style:bold,fg:light_grey,bg:purple)\$(parse_git_branch) "

final_prompt="${RESET}\n>> "

PS1="${user_section}${dir_section}${git_section}${final_prompt}"

export LS_COLORS='fi=1;93:di=1;96:ex=1;31:ln=target'
