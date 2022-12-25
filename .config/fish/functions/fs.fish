function fs --wraps='firefox --search' --description 'alias fs=firefox --search'
  nohup firefox --search "$argv" > /dev/null &; 
end
