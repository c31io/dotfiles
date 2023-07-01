function yacd --wraps='php -S 127.0.0.1:1234 -t ~/tools/yacd-gh-pages' --description 'alias yacd=php -S 127.0.0.1:1234 -t ~/tools/yacd-gh-pages'
  php -S 127.0.0.1:1234 -t ~/tools/yacd-gh-pages $argv
        
end
