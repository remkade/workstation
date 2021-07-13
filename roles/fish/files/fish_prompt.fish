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
  
  if test -z $divider_left
    set -g pixel '\ue0c4' '\ue0c5'
    set -g rounded '\ue0b4' '\ue0b6'
    set -g slashes '\ue0bc' '\ue0ba'
    set -g thixel '\ue0c6' '\ue0c7'
    set -g hexagon '\ue0cc' '\ue0cc'
    set -g trapezoid '\ue0d2' '\ue0d4'

    set divider_type (random choice 'rounded_facing' 'slash' 'pixel' 'hexagon' 'random')
    switch $divider_type
    case 'slash'
      set -gx divider_left (printf $slashes[1])
      set -gx divider_right (printf $slashes[2])
    case 'rounded_facing'
      set -gx divider_left (printf $rounded[1])
      set -gx divider_right (printf $rounded[2])
    case 'pixel'
      set -gx divider_left (printf $thixel[1])
      set -gx divider_right (printf $thixel[2])
    case 'hexagon'
      set -gx divider_left (printf $hexagon[1])
      set -gx divider_right (printf $hexagon[2])
    case 'trapezoid'
      set -gx divider_left (printf $trapezoid[1])
      set -gx divider_right (printf $trapezoid[2])
    case '*'
      set left (random choice '\ue0c4' '\ue0bc' '\ue0c6' '\ue0cc' '\ue0b4')
      set right (random choice '\ue0c5' '\ue0ba' '\ue0c7' '\ue0cc' '\ue0b6')
      set -gx divider_left (printf $left)
      set -gx divider_right (printf $right)
    end
  end

  if test -z $endcap
    set cap (random choice '\ue0b0' '\ue0b4' '\ue0cc')
    set -gx endcap (printf $cap)
  end

  set git_dir (printf '\ue725')
  set error_icon (printf '\ue780')

  set_color -b $primary
  set_color $text
  echo -n ' '(pwd | rev | cut -d/ -f1 | rev)' '
  set_color -b $tertiary
  set_color $primary
  echo -n $divider_left
  set_color $secondary
  echo -n ' '
  echo -n $divider_right
  set_color -b $secondary
  if test -d .git -o -d ../.git -o -d ../../.git
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
  echo -n "$endcap "
  set_color normal
end
