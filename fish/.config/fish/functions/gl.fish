function gl --wraps=git\ log\ --graph\ --format=format:\'\%C\(bold\ blue\)\%h\%C\(reset\)\ -\ \%C\(bold\ green\)\(\%ar\)\%C\(reset\)\ \%C\(white\)\%an\%C\(reset\)\%C\(bold\ yellow\)\%d\%C\(reset\)\ \%C\(dim\ white\)-\ \%s\%C\(reset\)\'\ --all --description alias\ gl=git\ log\ --graph\ --format=format:\'\%C\(bold\ blue\)\%h\%C\(reset\)\ -\ \%C\(bold\ green\)\(\%ar\)\%C\(reset\)\ \%C\(white\)\%an\%C\(reset\)\%C\(bold\ yellow\)\%d\%C\(reset\)\ \%C\(dim\ white\)-\ \%s\%C\(reset\)\'\ --all
  git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%an%C(reset)%C(bold yellow)%d%C(reset) %C(dim white)- %s%C(reset)' --all $argv
        
end
