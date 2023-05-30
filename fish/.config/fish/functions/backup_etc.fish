function backup_etc --wraps='sudo rsync -a --delete -quiet /etc /mnt/hdd' --description 'alias backup_etc=sudo rsync -a --delete -quiet /etc /mnt/hdd'
  sudo rsync -a --delete -quiet /etc /mnt/hdd $argv
        
end
