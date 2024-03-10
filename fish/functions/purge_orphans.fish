function purge_orphans --wraps='sudo pacman -Qtdq | sudo pacman -Rns -' --description 'alias purge_orphans=sudo pacman -Qtdq | sudo pacman -Rns -'
  sudo pacman -Qtdq | sudo pacman -Rns - $argv
        
end
