test -d ~/vd
and complete -c vdt -f \
  -a "(path basename (find ~/vd -mindepth 1 -maxdepth 1 -type d))"
