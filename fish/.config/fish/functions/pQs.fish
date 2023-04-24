function pQs --wraps='pacman -Qs' --description 'alias pQs=pacman -Qs'
  pacman -Qs $argv; 
end
