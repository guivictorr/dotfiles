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

SPACESHIP_USER_SHOW=false

SPACESHIP_CHAR_SYMBOL=" "
SPACESHIP_CHAR_PREFIX=""

SPACESHIP_NODE_SHOW=true
SPACESHIP_NODE_SYMBOL=" "

SPACESHIP_GIT_SYMBOL=" "
SPACESHIP_GIT_STATUS_PREFIX=" ["
SPACESHIP_GIT_STATUS_SUFFIX="] "
SPACESHIP_GIT_STATUS_ADDED=""
SPACESHIP_GIT_STATUS_UNTRACKED=""
SPACESHIP_GIT_STATUS_MODIFIED=""
SPACESHIP_GIT_STATUS_RENAMED=""
SPACESHIP_GIT_STATUS_DELETED=""
SPACESHIP_GIT_STATUS_STASHED=""
SPACESHIP_GIT_STATUS_UNMERGED=""
SPACESHIP_GIT_STATUS_AHEAD=""
SPACESHIP_GIT_STATUS_BEHIND=""
SPACESHIP_GIT_STATUS_DIVERGED=""
