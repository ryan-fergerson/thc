export ZSH="/root/.oh-my-zsh"

ZSH_THEME="refined"

source $ZSH/oh-my-zsh.sh

#https://github.com/ogham/exa/issues/453#issuecomment-616688922
alias ll="exa -la --icons"
alias lh="exa -l --icons"
alias lt="exa -T"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

declare -A sample
sample[dev]="localhost"
sample[deva]="localhost"
sample[devm]="localhost"
sample[dev1]="localhost"
sample[dev2]="localhost"
sample[qa]="localhost"

# Quick Shell
qsh() {
	if [[ "$1" == "sample" ]]; then
    set -x 
		ssh ${sample[$2]}
    set +x 
	elif [[ -n "$1" ]]; then
		echo "no"
	fi
}

# Quick Copy
qcp() {
	if [[ "$1" == "sample" ]]; then
    set -x 
		rsync -hPr --include="*/" --include="*.sql" --include="*.sh" --include="*.csv" --exclude='*' ./ ${sample[$2]}:/tmp
    set +x 
	elif [[ -n "$1" ]]; then
		echo "no"
	fi
}

