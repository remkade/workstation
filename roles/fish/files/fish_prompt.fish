function fish_prompt
  set primary 5fafff
  if test "$status" = "0"
    set secondary ffaf5f
  else
    set secondary ff8700
  end
  set tertiary ff5f5f

  set git_dir (printf "\ue725")
  set filled_top_left (printf "\ue0bc")
  set filled_bottom_right (printf "\ue0ba")
  set right_triangle (printf "\ue0b0")

  set_color -b $primary
  set_color fff
  echo -n " "(pwd | rev | cut -d/ -f1 | rev)" "
  set_color -b $tertiary
  set_color $primary
  echo -n $filled_top_left
  set_color $secondary
  echo -n " "
  echo -n $filled_bottom_right
  set_color -b $secondary
  if test -d .git; or git rev-parse --git-dir ^/dev/null >/dev/null
    set_color fff
    echo -n " $git_dir" (git symbolic-ref --quiet --short HEAD; or git rev-parse --short HEAD)
  else
    echo -n ' '
  end
  set_color normal
  set_color $secondary
  echo -n "$right_triangle "
  set_color normal
end
