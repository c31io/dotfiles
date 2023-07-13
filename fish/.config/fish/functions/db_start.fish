function db_start
  ssctl start redis && ssctl start minio && ssctl start mongodb
end
