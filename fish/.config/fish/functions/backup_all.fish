function backup_all --wraps='backup_etc && backup_pacman && backup_home' --description 'alias backup_all=backup_etc && backup_pacman && backup_home'
  backup_etc && backup_pacman && backup_home $argv
        
end
