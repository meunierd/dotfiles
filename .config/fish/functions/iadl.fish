function iadl
  ia download $argv (ia list $argv | fzf -m)
end
