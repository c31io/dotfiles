function v
  if test (count $argv) -eq 1

    if test -d $argv[1]
      set dir $argv[1]
      set file ""
    else if test -f $argv[1]
      set dir (git -C (dirname $argv[1]) rev-parse --show-toplevel)
      or $EDITOR $argv && return
      set file (realpath $argv[1])
    else
      $EDITOR $argv && return
    end

    cd $dir
    test -f .envrc
    and eval (direnv export fish)
    $EDITOR $file

  else

    $EDITOR $argv

  end
end
