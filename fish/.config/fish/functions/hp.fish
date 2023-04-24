function hp
  set -lx http_proxy 127.0.0.1:7890
  set -lx https_proxy $http_proxy
  set -lx ftp_proxy $http_proxy
  set -lx ftps_proxy $http_proxy
  set -lx rsync_proxy $http_proxy
  set -lx no_proxy "localhost,127.0.0.1,localaddress,.localdomain.com"
  set -lx all_proxy $http_proxy
  set -lx HTTP_PROXY $http_proxy
  set -lx HTTPS_PROXY $https_proxy
  set -lx FTP_PROXY $ftp_proxy
  set -lx RSYNC_PROXY $rsync_proxy
  set -lx NO_PROXY $no_proxy
  set -lx ALL_PROXY $all_proxy
  set -lx FTPS_PROXY $ftps_proxy
  $argv
end
