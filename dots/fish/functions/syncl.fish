function syncl
  rsync -avzPe 'ssh -p 22222' l.c31.io:'../../Shared' ~/Backup
end
