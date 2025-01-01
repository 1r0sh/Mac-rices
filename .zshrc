# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
 zsh-autosuggestions
 zsh-history-substring-search
 web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
#aliases
 alias nvimconfig=" nvim ~/.config/nvim/init.lua"
 alias zshconfig="nvim ~/.zshrc"
 alias DNSconfig='sudo nvim /etc/resolv.conf'
 alias skhdconfig='nvim ~/.config/skhd/skhdrc'
 alias yabaiconfig='nvim ~/.config/yabai/yabairc'
 alias ip='ifconfig en0 | grep "netmask" | awk "{print \$2}"'
 alias ls='eza --icons'
 alias music='musikcube'
 alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
 alias HostRun=' cd ~/Code/LocalHost && python3 -m http.server'
 alias top='btop'
 alias ff='fastfetch'
 alias nv='nvim'
 alias play='vlc --no-video-deco --no-embedded-video'
 alias download='wget'
#alias End

#function 
	function battery() {system_profiler SPPowerDataType | awk 'BEGIN{RS="System"; FS="Health"}NF>1{print $NF}'}
	function myip() {curl -sS ident.me | awk '{print $1}'}
  function barhide() {osascript -e 'tell application "System Events" to set autohide menu bar of dock preferences to true'}
  function barshow() {osascript -e 'tell application "System Events" to set autohide menu bar of dock preferences to false'}
  function sleepmode() {brew services stop sketchybar &&  yabai --stop-service && sudo pmset -a ttyskeepawake 0; sudo pmset -a powernap 0; sudo pmset -a tcpkeepalive 0; sudo pmset -a womp 0 ; sudo pmset -b standby 0
sudo pmset -a standbydelayhigh 3600 # set to hibernate after 1 hour
/usr/sbin/networksetup -setairportpower Wi-Fi off
pmset sleepnow}
#function End

#zoxide Configure
eval "$(zoxide init --cmd cd zsh)"
#zoxide Configure End
eval "$(oh-my-posh init zsh --config ~/.oh-my-zsh/themes/gruvbox.omp.json)"
