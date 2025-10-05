function _git_stack_worker --description 'Background worker function for git stack generation'
    # Get the variable name from command line argument
    set git_var_name $argv[1]

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
