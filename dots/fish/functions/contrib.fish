function contrib --wraps='gh contribs --scheme gh_original -W' --description 'alias contrib=gh contribs --scheme gh_original -W'
  gh contribs --scheme gh_original -W $argv
        
end
