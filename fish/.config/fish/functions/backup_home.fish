function backup_home --wraps='rsync -a --delete -quiet /home /mnt/hdd' --wraps='rsync -a --delete -quiet --exclude /home/c31io/.cache /home /mnt/hdd' --description 'alias backup_home=rsync -a --delete -quiet --exclude /home/c31io/.cache /home /mnt/hdd'
  rsync -a --delete -quiet --exclude /home/c31io/.cache /home /mnt/hdd $argv
        
end
