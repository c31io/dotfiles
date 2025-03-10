function contrib --wraps='gh contribs --scheme gh_original -W' --description 'alias contrib=gh contribs --scheme gh_original -W'
  gh contribs --scheme gh_original -W $argv || echo "gh extension install MintArchit/gh-contribs"
end
