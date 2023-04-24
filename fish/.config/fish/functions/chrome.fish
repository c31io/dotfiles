function chrome --wraps=google-chrome-stable\ --proxy-server=\'socks5://127.0.0.1:7890\' --description alias\ chrome=google-chrome-stable\ --proxy-server=\'socks5://127.0.0.1:7890\'
  google-chrome-stable --proxy-server='socks5://127.0.0.1:7890' $argv
        
end
