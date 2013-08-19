# Only set this if we haven't set $EDITOR up somewhere else previously.
if [[ "$EDITOR" == "" ]] ; then
  # Use vim for my editor.
  export EDITOR='vim'
fi

# Prevent python from generating pyc or pyo files
export PYTHONDONTWRITEBYTECODE=true
