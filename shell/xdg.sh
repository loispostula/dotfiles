#!/bin/sh
#
# ~/.config/sh/xdg - XDG Base Directory Specification

# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
test "$XDG_BIN_HOME" || export XDG_BIN_HOME="$HOME/.local/bin"
test "$XDG_CACHE_HOME" || export XDG_CACHE_HOME="$HOME/.cache"
test "$XDG_CONFIG_HOME" || export XDG_CONFIG_HOME="$HOME/.config"
test "$XDG_DATA_HOME" || export XDG_DATA_HOME="$HOME/.local/share"
test "$XDG_LIB_HOME" || export XDG_LIB_HOME="$HOME/.local/lib"
test "$XDG_CURRENT_DESKTOP" || export XDG_CURRENT_DESKTOP="sway"

# Environment variables respecting programs.
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export GEM_HOME="$XDG_DATA_HOME/gem"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export MU_HOME="$XDG_CACHE_HOME/mu"
export MYSQL_HISTFILE="$XDG_CACHE_HOME/mysql.history"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_DEVDIR="$XDG_CACHE_HOME/node-gyp"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PYLINTHOME="$XDG_DATA_HOME/pylint"
export PYLINTRC="$XDG_CONFIG_HOME/pylint/pylintrc"
export PYTHONHISTORY="$XDG_CACHE_HOME/python/python_history"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/pythonrc.py"
export thumbnail_dir="$XDG_CACHE_HOME/thumbnails/neofetch"
export WEGORC="$XDG_CONFIG_HOME/wego/config"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export YARN_CACHE_FOLDER="$XDG_CACHE_HOME/yarn"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump-${SHORT_HOST}-${ZSH_VERSION}"
export _Z_DATA="$XDG_DATA_HOME/z/data"
