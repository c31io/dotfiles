function bspmax --wraps='ln -fs .config/bspwm/bspwmrc.max .config/bspwm/bspwmrc' --description 'alias bspmax=ln -fs .config/bspwm/bspwmrc.max .config/bspwm/bspwmrc'
  ln -fs ~/.config/bspwm/bspwmrc.max ~/.config/bspwm/bspwmrc $argv; 
end
