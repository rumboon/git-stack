# Git Stack initialization
# This file is automatically loaded when Fish starts

# Initialize git stack variables
set -g _git_stack_initialized false

# Set up default git prompt colors and symbols
# These can be overridden by the user after installation
if not set -q __fish_git_prompt_show_informative_status
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_showupstream "informative"
    set -g __fish_git_prompt_showdirtystate 1
    set -g __fish_git_prompt_showstashstate 1
    set -g __fish_git_prompt_showuntrackedfiles 1

    # Configure git prompt characters
    set -g __fish_git_prompt_char_stateseparator ' '
    set -g __fish_git_prompt_char_cleanstate '✓'
    set -g __fish_git_prompt_char_dirtystate '✚'
    set -g __fish_git_prompt_char_untrackedfiles '…'
    set -g __fish_git_prompt_char_stagedstate '●'
    set -g __fish_git_prompt_char_invalidstate '✖'
    set -g __fish_git_prompt_char_stashstate '⚑'
    set -g __fish_git_prompt_char_upstream_ahead '↑'
    set -g __fish_git_prompt_char_upstream_behind '↓'
    set -g __fish_git_prompt_char_upstream_diverged '↕'

    # Configure git prompt colors
    set -g __fish_git_prompt_color_prefix brwhite
    set -g __fish_git_prompt_color_suffix brwhite
    set -g __fish_git_prompt_color_branch brpurple
    set -g __fish_git_prompt_color_branch_detached brred
    set -g __fish_git_prompt_color_dirtystate brred
    set -g __fish_git_prompt_color_stagedstate brgreen
    set -g __fish_git_prompt_color_invalidstate brred
    set -g __fish_git_prompt_color_untrackedfiles 808080
    set -g __fish_git_prompt_color_stashstate brblue
    set -g __fish_git_prompt_color_upstream brcyan
    set -g __fish_git_prompt_color_cleanstate brgreen
    set -g __fish_git_prompt_color_flags blue
end