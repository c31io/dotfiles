function gcma --wraps='git commit --amend' --description 'alias gcma=git commit --amend'
  git commit --amend $argv
        
end
