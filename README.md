# Git Stack

Asynchronous git status information for Fish shell prompts.

## Features

- Shows git branch status, dirty state, staged files, etc.
- Customizable git status symbols and colors
- Runs asynchronously to avoid blocking your prompt
- Automatic cleanup on directory changes

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher):

```fish
fisher install rumboon/git-stack
```

## Usage

The git stack detection runs automatically when used by a compatible prompt. The detected information is stored in the `$_git_stack_info` variable.

Manual usage:
```fish
_git_stack_async
# Check the result
echo $_git_stack_info
```

## Functions

- `_git_stack_async` - Main async git info function
- `_git_stack_worker` - Background worker for git status
- `_git_stack_cleanup` - Cleanup function for processes and variables

## Customization

The git stack uses Fish's built-in `__fish_git_prompt_*` variables for customization. See the worker function for default settings.
