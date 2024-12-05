function rmv --wraps='mv -t ~/.trash' --description 'alias rmv=mv -t ~/.trash'
  mkdir -p ~/.trash
  mv -t ~/.trash $argv
end
