function yacd
    set address 127.0.0.1:1234
    nh firefox $address &
    php -S $address -t ~/tools/yacd-gh-pages
end
