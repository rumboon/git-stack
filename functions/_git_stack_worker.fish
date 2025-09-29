function _git_stack_worker --description 'Background worker function for git stack generation'
    # Get the variable name from command line argument
    set git_var_name $argv[1]

    # Configure git prompt settings (same as your current setup)
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

    # Generate full git prompt with all verbose information
    set git_info (fish_git_prompt "%s")

    # Remove only the branch name, keeping all the detailed status info
    if test -n "$git_info"
        # Extract content between parentheses: "(branch_name status)" -> "branch_name status"
        set git_info (string replace -r '^\(' '' $git_info)
        set git_info (string replace -r '\)$' '' $git_info)

        # Remove only the branch name (first word), keep everything else
        set git_info (string replace -r '^[^ ]+ ' '' $git_info)
        set git_info (string trim $git_info)
    end

    # Set the universal variable to trigger repaint
    set --universal $git_var_name $git_info
end
