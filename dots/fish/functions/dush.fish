function dush --wraps='du -sh ./*' --description 'alias dush=du -sh ./*'
  du -sh ./* $argv; 
end
