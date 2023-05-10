function gf --wraps='git fetch' --wraps='git fetch -v' --description 'alias gf=git fetch -v'
  git fetch -v $argv
        
end
