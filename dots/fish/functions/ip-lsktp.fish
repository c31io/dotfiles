function ip-lsktp --wraps=ip\ a\ s\ enp0s31f6\ \|\ grep\ \'inet\ \'\ \|\ sed\ \'s/\ \ \ \ inet\ \\\(\[^/\]\*\\\)\\/.\*\$/\\1/\' --description alias\ ip-lsktp=ip\ a\ s\ enp0s31f6\ \|\ grep\ \'inet\ \'\ \|\ sed\ \'s/\ \ \ \ inet\ \\\(\[^/\]\*\\\)\\/.\*\$/\\1/\'
  ip a s enp0s31f6 | grep 'inet ' | sed 's/    inet \([^/]*\)\/.*$/\1/' $argv
        
end
