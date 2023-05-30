function backup_home
    rsync -a --delete -quiet --exclude /home/c31io/.cache --exclude /home/c31io/Downloads /home /mnt/hdd
end
