function _git_stack_cleanup --description 'Clean up git stack processes and variables'
    command kill $_git_last_pid 2>/dev/null
    set --erase _git_stack_info
end

# Set up event handlers for cleanup
function _git_stack_info_cleanup --on-variable PWD --on-event fish_exit
    _git_stack_cleanup
end