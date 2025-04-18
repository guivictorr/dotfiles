# Spaceship
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  node
  hg
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_USER_SHOW=always
SPACESHIP_CHAR_SYMBOL=""
SPACESHIP_CHAR_PREFIX=""
SPACESHIP_NODE_SHOW=true
SPACESHIP_NODE_SYMBOL=" "
SPACESHIP_GIT_SYMBOL=" "
