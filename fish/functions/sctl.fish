function sctl --wraps=systemctl --description 'alias sctl=systemctl'
  systemctl $argv; 
end
