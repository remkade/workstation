function fish_prompt
  set arrow_right (printf "\uf061")
  bubble_text --bg ffafaf --fg 000 (prompt_pwd)
  set_color 0af
  echo -n " $arrow_right "
  set_color normal
end
