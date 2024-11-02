function fish_greeting
  # clear
  command time -f "%Ems" podman run -it --rm macabees/neofetch
end
starship init fish --print-full-init | sed 's/"$(commandline)"/(commandline | string collect)/' | source
# fish_config prompt choose pythonista
alias dojava="javac *.java && java"
alias stacscheck="/cs/studres/Library/stacscheck/stacscheck"
set -Ux NETHOME "/cs/home/$USER/"
