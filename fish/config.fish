function fish_greeting
  # clear
  # command time -f "%Ems" podman run -it --rm macabees/neofetch
  fastfetch
end
function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

starship init fish --print-full-init | sed 's/"$(commandline)"/(commandline | string collect)/' | source
# fish_config prompt choose pythonista
alias dojava="javac *.java && java"
alias stacscheck="/cs/studres/Library/stacscheck/stacscheck"
alias py=python
alias checkin="/cs/studres/ct/checkin"
set -Ux NETHOME "/cs/home/$USER/"
