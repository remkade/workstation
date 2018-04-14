function fish_prompt
  set primary 005fff
  if test "$status" = "0"
    set secondary ff0
  else
    set secondary ff8700
  end

  set arrow_right (printf "\uf061")
  set filled_top_left (printf "\ue0bc")
  set filled_bottom_right (printf "\ue0ba")
  set right_triangle (printf "\ue0b0")
  set forward_slash (printf "\ue0bb")

  set_color -b $primary
  set_color fff
  echo -n " "(prompt_pwd)" "
  set_color normal
  set_color $primary
  echo -n $filled_top_left
  set_color $secondary
  echo -n " "
  echo -n $filled_bottom_right
  set_color -b $secondary
  echo -n ' '
  set_color normal
  set_color $secondary
  echo -n "$right_triangle "
  set_color normal
end
