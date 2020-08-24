# git checkout <branch>
bindkey -s '^gb' 'git branch | fzf --height 40% --reverse | cut -c 3- | xargs git switch^M'

# git push <remote>
bindkey -s '^gp' 'git remote | fzf --height 40% --reverse | xargs git push^M'

# git commit preview
bindkey -s '^gc' 'git log --oneline | fzf --reverse --preview "cut -f 1 -d \u27 \u27 <<< {} | xargs git show --color=always --pretty=format:%b"^M'

# git rebase <remote>
bindkey -s '^gr' 'git remote | fzf --height 20% --reverse | xargs git rebase^M'
