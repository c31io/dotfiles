function vdt
  test (count $argv) -gt 1
  and return 1
  set base (string escape $argv[1])
  set dir ~/vd/$base
  or set dir ~/vd
  ls -r $dir/* | xargs bat
end
