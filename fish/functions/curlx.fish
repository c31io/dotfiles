function curlx --wraps='curl -x http://127.0.0.1:7890' --description 'alias curlx=curl -x http://127.0.0.1:7890'
  curl -x http://127.0.0.1:7890 $argv; 
end
