function hpg
  set -gx http_proxy 127.0.0.1:7890
  set -gx https_proxy $http_proxy
  set -gx ftp_proxy $http_proxy
  set -gx ftps_proxy $http_proxy
  set -gx rsync_proxy $http_proxy
  set -gx no_proxy "localhost,127.0.0.1,localaddress,.localdomain.com"
  set -gx all_proxy $http_proxy
  set -gx HTTP_PROXY $http_proxy
  set -gx HTTPS_PROXY $https_proxy
  set -gx FTP_PROXY $ftp_proxy
  set -gx RSYNC_PROXY $rsync_proxy
  set -gx NO_PROXY $no_proxy
  set -gx ALL_PROXY $all_proxy
  set -gx FTPS_PROXY $ftps_proxy
  if set -q $argv[1]
    $argv
  end
end
