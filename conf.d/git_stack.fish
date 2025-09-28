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
end