function powersave --description 'alias powersave=sudo cpupower frequency-set -g powersave'
  sudo cpupower frequency-set -g powersave $argv
        
end
