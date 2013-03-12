# .bashrc

# User specific aliases and functions


function trunc() {
  cut -c 1-$1
}

if [ -f .bashrc_fb ]; then
  source .bashrc_fb
fi


export EDITOR=vim
alias gamend='[ `git show "--format=%aE" | head -n 1 | sed "s/@.*//"` = mcduff ] && git commit -a --amend -C HEAD || echo "you are not the last committer"'
alias vimgit='vim -O `git diff --name-only HEAD^`'
alias vimgitnew='vim -O `git diff --name-only HEAD`'
alias gitfiles='git diff --name-only HEAD^ | cat'
alias howfresh="git show --format=%cr | head -n 1"
alias shortlog="git log --oneline -n 5"

# pipeables
alias aus='au | sort -n'
alias au='awk '\''{ a[$0]++ } END { for (b in a) { print a[b] "\t" b} }'\'''
alias unseen='awk '\''{ if (a[$0] != '1') { print $0; a[$0] = '1' }}'\'''
alias tabbify="sed 's/\x01/\t/g'"
alias ircify="sed 's/^/ /'"
alias uniq_count="sort | uniq | wc -l"
alias nohead="awk '{if (a == 1) {print \$0} else {a = 1}}'"
alias replacenewline="tr '\n'"
alias linelength="awk '{print length(\$0)}'"

alias bp="bpython"

alias findswp="find . -name '.*.*.swp'"
export PS1="[\u@\h \W\$(git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/')]\$ "

function pythawesome() {
  python -i -c "import sys; import subprocess; p = subprocess.Popen(['$1'], shell=True, stdout=subprocess.PIPE); print 'lines in p.stdout';"
}

