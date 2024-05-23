function nh --wraps=nohup --description 'alias nh=nohup'
  nohup $argv &> /dev/null &
  disown
end
