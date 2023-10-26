function pQl --wraps='pacman -Ql | bat' --wraps='pacman -Ql' --description 'alias pQl=pacman -Ql'
  pacman -Ql $argv
        
end
