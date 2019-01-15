function fish_mode_prompt
  set i_term (printf '\ue7a2')
  set i_pencil (printf '\uf040')
  set i_eye (printf '\ufbce')
  set i_question (printf '\uf128')
  set i_window (printf '\uf2d0')
  set i_tools (printf '\uf425')
  set i_info (printf '\uf7fc')
  switch $fish_bind_mode
  case default
    echo -n $i_tools
  case insert
    echo -n $i_term
  case replace_one
    echo -n $i_pencil
  case visual
    echo -n $i_eye
  case '*'
    echo -n $i_question
  end
  echo -n ' '
  set_color normal
end
