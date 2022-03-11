###     Rogerio Junior
###   https://github.com/rogeriojunior31
###   https://www.linkedin.com/in/rogerioqjunior/
###
### My fish config. Not much to see here; just some pretty standard stuff

##############################
##### Fish Configuration #####
##############################

function fish_greeting
    echo "----------------------------------------------------------------------------"
    echo "“Bem vindo Mestre dos Magos” - Rogerin"
    echo "----------------------------------------------------------------------------"
end
# set locale
set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
# set default editor
set -x EDITOR nvim
# override colors
set -x fish_color_command normal
set -x fish_color_autosuggestion blue
set -x fish_color_error red
# set gpg tty
set -x GPG_TTY (eval tty)
# PATH
test -d /usr/local/bin  ;and set PATH /usr/local/bin  $PATH
test -d /usr/local/sbin ;and set PATH /usr/local/sbin $PATH
# Set GO lang path
test -d $HOME/go ;and set -x GOPATH $HOME/go ;and set PATH $GOPATH/bin $PATH
test -d /usr/local/opt/go/libexec ;and set -x GOROOT /usr/local/opt/go/libexec ;and set PATH $GOROOT/bin $PATH
# set Rust lang path
test -d $HOME/.cargo/bin ;and set PATH $HOME/.cargo/bin $PATH
# set rebar3 for Erlang
test -d $HOME/.cache/rebar3/bin ;and set PATH $HOME/.cache/rebar3/bin $PATH
# set Java JDK to path
test -d /usr/libexec/java_home ;and set -x JAVA_HOME (/usr/libexec/java_home)
# test -d /usr/local/share/android-sdk ;and set -x ANDROID_SDK_ROOT /usr/local/share/android-sdk
# test -d /usr/local/share/android-sdk ;and set -x ANDROID_HOME /usr/local/share/android-sdk
# add rbenv to $PATH
# status --is-interactive; and source (rbenv init -|psub)
# Need this to expose global packages installed via yarn
test -d $HOME/.config/yarn/global/node_modules/.bin ;and set PATH $HOME/.config/yarn/global/node_modules/.bin $PATH
# set Android SDK
test -d $HOME/Library/Android/ ;and set -x ANDROID_SDK_ROOT $HOME/Library/Android/sdk
test -d $HOME/Library/Android/ ;and set -x ANDROID_HOME $HOME/Library/Android/sdk
test -d $HOME/Library/Android/ ;and set PATH $ANDROID_HOME/tools $PATH
test -d $HOME/Library/Android/ ;and set PATH $ANDROID_HOME/platform-tools $PATH
# Postgres App
test -d /Applications/Postgres.app/Contents/Versions/latest/bin ;and set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH


#############################
##### Functions/Aliases #####
#############################

#--------------------
#====> UTILITIES
#--------------------

# clear command shortcut
function cl ; clear ; end
# Neovim quick configuration
function vconfig ; nvim ~/.config/nvim/init.vim ; end
# Tmux quick configuration
function tconfig ; nvim ~/.tmux.conf ; end
# Fish shell quick configuration
function fconfig ; nvim ~/.config/fish/config.fish ; end
# Fish shell reload
function freload ; source ~/.config/fish/config.fish ; end
# Create a new directory and enter it
function md ; mkdir -p $argv ;and cd $argv ; end
# Remove all folder contents
function rma
    set_color blue; echo ">>> Delete everything on '$PWD'? (y/N)"; set_color normal;
    read yn
    if test $yn = "y"
        cd .. ;and rm -rf dir ;and  mkdir dir ;and cd dir
    end
end
function killp
    kill (lsof -i tcp:$argv | tail -n +2 | awk '{ print $2 }')
end

#----------------------------
#====> DIRECTORY LISTING
#----------------------------
# Compact view, show colors
function lc ; ls -G ; end
# Compact view, show hidden
function la ; ls -AF ; end
# shortcut to 'ls -al'
function ll ;  ls -al ; end

#-----------------
#====> NEOVIM
#-----------------
# open neovim
function v ; nvim $argv ; end
# open neovim
function vi ; nvim $argv ; end

#-------------------
#====> GIT
#-------------------
# Git status
function gs ; git status ; end
# Git log
function gl ; git log --oneline --graph --color --decorate --date=relative --all ; end
# Git add
function ga ; git add $argv ; end
# Git add all
function gaa ; git add -A . ; end
# Git Diff
function gd ; git diff --color=always ; end
# Git Branch
function gb ; git branch ; end
# Git checkout
function gco ; git checkout ; end
# Git merge
function gm ; git merge ; end
# Git tag
function gt ; git tag ; end
# Git pull
function pull ; git pull $argv ; end
# Git pull origin master
function pullom ; git pull origin master ; end
# Git commit
function gc ; git commit -m $argv ; end
# Git push
function gp ; git push $argv ; end
# Git push origin master
function gpom ; git push origin master ; end


#-------------------
#====> TMUX
#-------------------
#Tmux shortcut
function t ; tmux $argv ; end
#Tmux new session
function tn ; tmux new -s $argv ; end
# Tmux list
function tl ; tmux ls ; end
# Tmux kill session
function tk ; tmux kill-session -t $argv ; end
# Tmux kill all
function tka ; tmux kill-server ; end
# Tmux attach
function ta ; tmux a -t $argv ; end
# Tmux detach
function td ; tmux detach ; end

#------------------
#====> Npm / Yarn
#------------------
# Npm install global packages
function ngi ; npm install -g $argv ; end
# Npm uninstall global packages
function ngu ; npm uninstall -g $argv ; end
# Npm list global packages
function ngl ; npm -g ls --depth=0 ; end
# Npm list local packages
function nll ; npm ls --depth=0 ; end
# Npm project shortcuts
function nt ; npm test ; end
function ns ; npm start ; end
function nr ; npm run ; end
function nd ; npm run dev ; end
function nb ; npm run build ; end
function ndt ; npm run dev:test ; end
function nds ; npm run dev:ssr ; end
# Yarn install global packages
function ygi ; yarn global add $argv ; end
# Yarn uninstall global packages
function ygu ; yarn global remove $argv ; end
# Yarn list global packages
function ygl ; yarn global ls ; end
# Yarn list local packages
function yl ; yarn list --depth=0 ; end


#------------------
#====> DOCKER
#------------------
# Remove Image
function dri ; docker rmi $argv ; end
# Remove Dangling Images
function drid ; docker images -qf dangling=true | xargs docker rmi ; end
# List Containers
function dls ; docker container ls ; end
# List all containers
function dll ; docker container ls -a ; end
# Run a command
function dex ; docker exec --interactive --tty $argv ; end
# Remove a container
function drc ; docker rm $argv ; end
# Docker Compose
function dc ; docker-compose $argv ; end
function dcu ; docker-compose up $argv -d ; end
function dcd ; docker-compose down ; end
function dcr ; docker-compose run $argv ; end

#----------------
#====> OTHER
#----------------
# Tree always with color
function tc ; tree -C ; end

# add asdf to $PATH
# status --is-interactive; and source /usr/local/opt/asdf/asdf.fish
test -d /usr/local/opt/asdf/ ;and source /usr/local/opt/asdf/asdf.fish

# direnv config
test -x /usr/local/bin/direnv ;and eval (direnv hook fish)

# bat config
test -x /usr/local/bin/bat ;and set -x BAT_THEME ansi-dark

