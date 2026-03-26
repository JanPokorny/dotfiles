set -gx LESS_TERMCAP_mb (set_color -o red)
set -gx LESS_TERMCAP_md (set_color -o 5fafd7)
set -gx LESS_TERMCAP_me (printf "\e[0m")
set -gx LESS_TERMCAP_so (set_color 949494)
set -gx LESS_TERMCAP_se (printf "\e[0m")
set -gx LESS_TERMCAP_us (set_color -u afafd7)
set -gx LESS_TERMCAP_ue (printf "\e[0m")
set -gx LESS '-R -s'
