function vd --wraps='v ~/Documents/diary/2023-01-11' --description 'alias vd=v ~/Documents/diary/2023-01-11'
  v ~/Documents/diary/$(date -I) $argv; 
end
