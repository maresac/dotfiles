#
# git
#
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch -v'
alias gbc='git checkout -b'
alias gbcr='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gbd='git branch -d'
alias gbdr='git push origin --delete'
alias gc='git commit'
alias gca='git commit --verbose --all'
alias gcam='git commit --all --message'
alias gcm='git commit --message'
alias gco='git checkout'
alias gcp='git cherry-pick -x'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log --pretty=format:"%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%an]" --decorate --date=short'
alias gll='git log --pretty=format:"%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%an]" --decorate --date=short --name-status'
alias gls='git log --graph --prettyformat:"%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%an]" --decorate --date=short'
alias gm='git merge'
alias gp='git pull'
alias gps='git push'
alias gr='git remote -v'
alias gs='git status -sb'
alias gsh='git show'
alias gt='git tag -a -s'=
alias gtl='git tag -l -n1 | sort -V'

#
# kubectl
#
alias k='kubectl'
alias ka='kubectl apply -f'
alias kcn='kubectl config use-context'
alias kd='kubectl describe'
alias kg='kubectl get'
alias kga='kubectl get pods,services,deployments,statefulsets'
alias kgaw='watch -n1 -t kubectl get pods,services,deployments,statefulsets'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kl='kubectl logs'
alias klf='kubectl logs -f --tail=10'
alias klt='kubectl logs --tail=100`'
alias kpf='kubectl port-forward'
alias kx='kubectl exec -it'

#
# kubelogin
#
alias klpro="kubelogin --prod --username carolin.dohmen --password $(pass ldap)"
alias kldev="kubelogin --username carolin.dohmen --password $(pass ldap)"
