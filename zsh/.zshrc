source "${HOME}/.zplug/init.zsh"

zstyle ':prezto:*:*' case-sensitive 'yes'
zstyle ':prezto:*:*' color 'yes'
zstyle ':prezto:module:editor' key-bindings 'vi'
zstyle ':prezto:module:prompt' theme 'peepcode' '❯'
zstyle ':prezto:module:git:alias' skip 'yes'
zstyle ':prezto:module:utility' safe-ops 'no'

zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/prompt", from:prezto

zplug "modules/git", from:prezto
zplug "modules/python", from:prezto

zplug "lukechilds/zsh-nvm"
zplug "jonmosco/kube-ps1", use:"kube-ps1.sh"
zplug "${HOME}/.zsettings", from:local

if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load
