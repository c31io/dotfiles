test -d ~/vd
and complete -c vd -f -a "(path basename (find ~/vd -maxdepth 1 -type f))"
