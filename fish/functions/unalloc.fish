function unalloc
  btrfs fi us / &| rg una | awk '{ print $3 }'
end
