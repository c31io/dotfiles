function gcma --wraps='git commit --ammend' --description 'alias gcma=git commit --ammend'
  git commit --ammend $argv
        
end
