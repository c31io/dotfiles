function uri_decode
    echo $argv | perl -pe 's/\+/\ /g;' -e 's/%(..)/chr(hex($1))/eg;'
end
