function db_stop
  ssctl stop redis && ssctl stop minio && ssctl stop mongodb
end
