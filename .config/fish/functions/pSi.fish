function pSi --wraps='pacman -Si' --description 'alias pSi=pacman -Si'
  pacman -Si $argv; 
end
