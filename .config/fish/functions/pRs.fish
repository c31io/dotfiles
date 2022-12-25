function pRs --wraps='sudo pacman -Rs' --description 'alias pRs=sudo pacman -Rs'
  sudo pacman -Rs $argv; 
end
