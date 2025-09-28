function _git_stack_async --description 'Asynchronously generate git stack information'
    # Initialize git prompt variables if not already set
    if not set -q _git_stack_init
        set -g _git_stack_init true
        set -g _git_stack_info _git_stack_info_$fish_pid

        # Set up variable watcher for git prompt updates
        function $_git_stack_info --on-variable $_git_stack_info
            commandline --function repaint
        end
    end

    # Kill any previous git prompt process
    command kill $_git_last_pid 2>/dev/null

    # Check if we're in a git repository quickly
    if not command git --no-optional-locks rev-parse --git-dir >/dev/null 2>&1
        set --universal $_git_stack_info ""
        return
    end

    # Start async git prompt generation using worker function
    fish --private -c "_git_stack_worker $_git_stack_info" &

    set -g _git_last_pid $last_pid
end
