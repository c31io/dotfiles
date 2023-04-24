function bmin --wraps='ln -fs .config/bspwm/bspwmrc.min .config/bspwm/bspwmrc' --wraps='ln -fs ~/.config/bspwm/bspwmrc.min ~/.config/bspwm/bspwmrc' --description 'alias bmin=ln -fs ~/.config/bspwm/bspwmrc.min ~/.config/bspwm/bspwmrc'
  ln -fs ~/.config/bspwm/bspwmrc.min ~/.config/bspwm/bspwmrc $argv
        
end
