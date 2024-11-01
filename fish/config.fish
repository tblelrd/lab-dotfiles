function fish_greeting
  # clear
  command time -f "%Ems" podman run -it --rm macabees/neofetch
end
function starship_transient_prompt_func
  starship module character
end
starship init fish | source
# fish_config prompt choose pythonista
alias dojava="javac *.java && java"
alias stacscheck="/cs/studres/Library/stacscheck/stacscheck"
set -Ux NETHOME "/cs/home/$USER/"
