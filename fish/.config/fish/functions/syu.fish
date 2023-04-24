function syu --wraps='sudo pacman -Syu' --description 'alias syu=sudo pacman -Syu'
  sudo pacman -Syu $argv; 
end
