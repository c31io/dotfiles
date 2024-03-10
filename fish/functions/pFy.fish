function pFy --wraps='pacman -Fy' --wraps='sudo pacman -Fy' --description 'alias pFy=sudo pacman -Fy'
  sudo pacman -Fy $argv
        
end
