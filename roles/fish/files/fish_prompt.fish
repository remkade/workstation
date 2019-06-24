function fish_prompt
  set last_status $status

  set color_scheme_file "$HOME/.config/fish/color_schemes.yaml"

  if test -z $COLOR_SCHEME
    eval (random_color_scheme)
  end

  if test "$last_status" = '0'
    set secondary $secondary_normal
  else
    set secondary $secondary_error
  end
				# slash     pixel  thick pix  hexagon  rounded
  set divider_left (random choice '\ue0c4' '\ue0bc' '\ue0c6' '\ue0cc' '\ue0b4')
				# slash     pixel    thick pix  rounded
  set divider_right (random choice '\ue0c5' '\ue0ba' '\ue0c7' '\ue0b6')
  set git_dir (printf '\ue725')
  set filled_top_left (printf $divider_left)
  set filled_bottom_right (printf $divider_right)
  set right_triangle (printf '\ue0b0')
  set error_icon (printf '\ue780')

  set_color -b $primary
  set_color $text
  echo -n ' '(pwd | rev | cut -d/ -f1 | rev)' '
  set_color -b $tertiary
  set_color $primary
  echo -n $filled_top_left
  set_color $secondary
  echo -n ' '
  echo -n $filled_bottom_right
  set_color -b $secondary
  if test -d .git; or git rev-parse --git-dir ^/dev/null >/dev/null
    set_color $text
    echo -n " $git_dir" (git symbolic-ref --quiet --short HEAD; or git rev-parse --short HEAD)
  else
    if test "$last_status" = '0'
      echo -n ' '
    else
      set_color $text
      echo -n $error_icon
    end
  end
  set_color normal
  set_color $secondary
  echo -n "$right_triangle "
  set_color normal
end
