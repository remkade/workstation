function fish_prompt
  set last_status $status

  switch "$COLOR_SCHEME"
  case rad
    set primary EF476f
    set text 000
    set secondary_normal 06d6a0
    set secondary_error 118ab2
    set tertiary ffd166
  case starbucks
    set primary 006341
    set text fff
    set secondary_normal 7F3A0F
    set secondary_error d00
    set tertiary 2B8815 
  case cool
    set primary 20bf55
    set text fff
    set secondary_normal 01baef
    set secondary_error 757575
    set tertiary 0b4f6c 
  case '*'
    set primary 5fafff
    set text fff
    set secondary_normal ffaf5f
    set secondary_error ff8700
    set tertiary ff5f5f
  end

  if test "$last_status" = '0'
    set secondary $secondary_normal
  else
    set secondary $secondary_error
  end

  set git_dir (printf '\ue725')
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
