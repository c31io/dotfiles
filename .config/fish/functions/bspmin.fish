function bspmin --wraps='ln -fs .config/bspwm/bspwmrc.min .config/bspwm/bspwmrc' --description 'alias bspmin=ln -fs .config/bspwm/bspwmrc.min .config/bspwm/bspwmrc'
  ln -fs ~/.config/bspwm/bspwmrc.min ~/.config/bspwm/bspwmrc $argv; 
end
