function vdt
  test (count $argv) -gt 1
  and echo "expect one argument" && return 1

  set base (string escape $argv[1])
  set dir ~/vd/$base
  or set dir ~/vd

  test -d $dir
  or echo "$dir not fount" && return 1
  find $dir -maxdepth 1 -type f | sort -r | xargs bat
end
