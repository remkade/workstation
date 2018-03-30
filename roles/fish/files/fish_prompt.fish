function fish_prompt
  set_color 87ff87
  echo -n (prompt_pwd)
  set_color 0af
  echo -n " ► "
  set_color normal
end
