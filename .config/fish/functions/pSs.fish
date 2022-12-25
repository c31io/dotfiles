function pSs --wraps='pacman -Ss' --description 'alias pSs=pacman -Ss'
  pacman -Ss $argv; 
end
