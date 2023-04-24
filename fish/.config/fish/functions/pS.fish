function pS --wraps='sudo pacman -S' --description 'alias pS=sudo pacman -S'
  sudo pacman -S $argv; 
end
