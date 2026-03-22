function nh
  nohup $argv &> /dev/null &
  disown
end
