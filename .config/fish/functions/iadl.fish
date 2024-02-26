function iadl
  ia download -t 300 $argv (ia list $argv | fzf -m)
end
