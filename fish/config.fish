function fish_greeting
    # clear
    command time -f "%Ems" podman run -it --rm macabees/neofetch
end

fish_config prompt choose pythonista
alias dojava="javac *.java && java"
