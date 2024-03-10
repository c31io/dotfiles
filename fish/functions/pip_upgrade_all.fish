function pip_upgrade_all
  python3 -m pip list --outdated --format=json | jq -r '.[] | "\(.name)==\(.latest_version)"' | xargs -n1 pip3 install -U
end
