function backup-home --wraps='rsync -a --delete -quiet /home /mnt/hdd' --description 'alias backup-home=rsync -a --delete -quiet /home /mnt/hdd'
  rsync -a --delete -quiet /home /mnt/hdd $argv
        
end
