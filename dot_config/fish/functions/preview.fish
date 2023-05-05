function preview -a path
  if [ -d $path ]
    lsd --group-directories-first --color=always --icon=always $path
  else
    viu $path 2>/dev/null || bat --color=always --plain $path
  end
end
