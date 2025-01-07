function preview -a path
  if [ -d $path ]
    lsd --group-directories-first --color=always --icon=always $path
  else
    chafa $path 2>/dev/null || bat --color=always --plain $path
  end
end
