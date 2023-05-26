function db --wraps='ssctl enable redis; ssctl enable minio; ssctl enable mongodb' --wraps='ssctl start redis; ssctl start minio; ssctl start mongodb' --description 'alias db=ssctl start redis; ssctl start minio; ssctl start mongodb'
  ssctl start redis; ssctl start minio; ssctl start mongodb $argv
        
end
