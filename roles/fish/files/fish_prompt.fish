function fish_prompt
  set last_status $status

  if test "$COLOR_SCHEME" = 'rad'
    set primary EF476f
    set text 000
    if test "$last_status" = '0'
      set secondary 06d6a0
    else
      set secondary 118ab2
    end
    set tertiary ffd166
  else if test "$COLOR_SCHEME" = 'starbucks'
    set primary 006341
    set text fff
    if test "$last_status" = '0'
      set secondary 7F3A0F
    else
      set secondary d00
    end
    set tertiary 2B8815 
  else
    set primary 5fafff
    set text fff
    if test "$last_status" = '0'
      set secondary ffaf5f
    else
      set secondary ff8700
    end
    set tertiary ff5f5f
  end

  set git_dir (printf '\ue25')
  set filled_top_left (printf '\ue0bc')
  set filled_bottom_right (printf '\ue0ba')
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
