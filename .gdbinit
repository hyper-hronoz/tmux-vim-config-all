set history save on
set history size 1000

set trace-commands on
set logging overwrite on
# show logging

define reconnect
  target extended-remote:3333
end

define tuid
  tui disable
end

define tuie
  tui enable
end

define sb
  save breakpoints breakpoints
end

define lb
  source breakpoints
end

