# zsh add quotes around words

You need to add/remove quotes around some words in command line and you tired
of this? I have the solution.

![usage example](http://i.imgur.com/dpFGBvz.gif)

# Installation

You can install plugin via [antigen](https://github.com/zsh-users/antigen):
```
antigen bundle kovetskiy/zsh-quotes
```

Or manually:
```
git clone https://github.com/kovetskiy/zsh-quotes ~/.zsh-quotes/
```
and add including to your `.zshrc`:
```
source ~/.zsh-quotes/plugin.zsh
```

# Usage

First, you should add binding, for example with `CTRL+O`
```
bindkey -v '^O' toggle-quotes
```

After that you should reload zsh.
