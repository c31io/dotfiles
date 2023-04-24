function vdt --wraps='ls -r ~/Documents/diary/* | xargs bat' --description 'alias vdt=ls -r ~/Documents/diary/* | xargs bat'
  ls -r ~/Documents/diary/* | xargs bat $argv
        
end
