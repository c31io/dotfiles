function fs --wraps='firefox --search' --description 'alias fs=firefox --search'
  nh firefox --search "$argv"
end
