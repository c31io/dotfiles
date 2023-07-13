function backup_etc
  sudo rsync -a --delete --progress /etc /mnt/hdd
end
