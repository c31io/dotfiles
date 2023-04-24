function rmv --wraps='mv -t ~/.trash' --description 'alias rmv=mv -t ~/.trash'
  mv -t ~/.trash $argv; 
end
