function usync
  if test $hostname = 'lsktp'
    unison /data/Sync ~/Sync -perms 0 $argv
  else
    unison -sshargs '-p 22222' ~/Sync ssh://lsktp.c31.io//home/c31io/Sync
  end
end
