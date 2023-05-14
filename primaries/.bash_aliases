alias gl="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(blue)†%C(magenta)%an%Creset' --abbrev-commit"

code () { 
VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* 
}