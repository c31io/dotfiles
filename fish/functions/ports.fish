function ports --wraps='sudo lsof -i -P -n' --description 'alias ports=sudo lsof -i -P -n'
  sudo lsof -i -P -n $argv
        
end
