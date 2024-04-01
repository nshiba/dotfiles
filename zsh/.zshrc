## Added by Zplugin's installer
source ~/.zplug/init.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

source /Users/naoya-shibahara/.cpad2/profile

for i  in ~/.zsh/*.zsh; do
  source $i
done

### complition begin

fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

# 補完機能有効にする
autoload -U compinit
compinit -u
 
# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"
 
# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed
 
# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

### bin
export PATH=$PATH:/Users/naoya-shibahara/work/bin

### my scripts root

export MY_SCRIPTS_ROOT=/Users/naoya-shibahara/work/src/github.com/nshiba/scripts
export PATH=$PATH:$MY_SCRIPTS_ROOT

### completion end

export AWS_REGION=ap-northeast-1

### temtab development key

export API_KEY_ANDROID_STORE_LIVE_TEMTAB=development


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/naoya-shibahara/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/naoya-shibahara/work/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/naoya-shibahara/work/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/naoya-shibahara/work/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/naoya-shibahara/work/google-cloud-sdk/completion.zsh.inc'; fi

### node
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
