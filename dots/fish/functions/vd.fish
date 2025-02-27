function vd
  test (count $argv) -gt 1
  and echo "expect one argument" && return 1

  set base (string escape $argv[1])
  set dir ~/vd/$base
  or set dir ~/vd

  mkdir -p $dir
  v $dir/$(date -I)
end
