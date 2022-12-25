function syun --wraps='sudo pacman -Syu --need' --wraps='sudo pacman -Syu --needed' --description 'alias syun=sudo pacman -Syu --needed'
  sudo pacman -Syu --needed $argv; 
end
