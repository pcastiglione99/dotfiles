# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Default Apps
export EDITOR="nvim"
export READER="zathura"
export VISUAL="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export VIDEO="mpv"
export IMAGE="feh"

# Fixing Paths
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export __GL_SHADER_DISK_CACHE_PATH=$XDG_CACHE_HOME/nv/
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/nv/
export ICEAUTHORITY=$XDG_CACHE_HOME/ICEauthority/
export ZSH="$ZDOTDIR/.oh-my-zsh"
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
alias svn="svn --config-dir \"$XDG_CONFIG_HOME\"/subversion"
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel

# Path
export PATH="$HOME/.local/bin:$PATH"

