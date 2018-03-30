function bubble_text
  argparse 'b/bg=' 'f/fg=' -- $argv

  set left_bubble (printf '\ue0b6')
  set right_bubble (printf '\ue0b4')

  set_color $_flag_bg
  echo -n $left_bubble
  set_color $_flag_fg
  set_color -b $_flag_bg
  echo -n " "$argv" "
  set_color normal
  set_color $_flag_bg
  echo -n $right_bubble
  set_color normal
end
