function yacd
    set address 127.0.0.1:1234
    php -S $address -t ~/tools/yacd-gh-pages &
    nh firefox $address
end
