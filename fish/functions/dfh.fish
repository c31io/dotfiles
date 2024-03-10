function dfh
  df -h -x tmpfs -x devtmpfs -x efivarfs $argv; 
end
