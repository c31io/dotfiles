function iwshow --wraps='iwctl station wlan0 show' --description 'alias iwshow=iwctl station wlan0 show'
  iwctl station wlan0 show $argv
        
end
