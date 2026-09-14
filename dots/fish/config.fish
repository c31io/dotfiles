if status is-interactive
    zoxide init fish | source
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
if test $hostname = 'airio'
    source ~/.orbstack/shell/init2.fish 2>/dev/null || :
end
