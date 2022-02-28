## First and foremost
This was copied and then tweaked from [Diéssica Gurskas' dotfiles](https://github.com/diessica/dotfiles), big thanks to her and everyone she followed.

## Note
Not every file in this repository is being directly used. Some files, such as editor settings, are here for backup purposes.

## TODOS:
 - [ ] (setup_python.sh)[https://opensource.com/article/19/5/python-3-default-mac#what-to-do]
 - [ ] HammerSpoon config (~/.hammerspoon)
 - [ ] https://github.com/technicalpickles/homesick
 - [ ] Keybindings (eg. Alfred)
 - [ ] Set up BTT
 - [ ] Get rid of `is already installed` warnings
 - [ ] Enable nightshift

<!-- Inspiration for next time:
- https://github.com/paulmillr/dotfiles
- https://github.com/lukechilds/zsh-nvm
-->

## let's go
**1.** Check for software updates.
```sh
$ sudo softwareupdate -i -r
```

**2.** Get this project somehow and go to its directory. Using [Git](http://www.git-scm.com/):
```sh
$ git clone https://github.com/sseppola/config.git ~/config
$ cd ~/config
```

**3.** Install and configure CLI tools
```sh
$ sh ./install-cli-tools.sh # installs Xcode Command Line Tools, Brew ++
$ sh ./configure-zsh.sh     # Not needed anymore, xsh is already default
$ sh ./install-dotfiles.sh
```


**3.** Install Mac applications (see [caskfile](brew/caskfile)) and fonts (see [fontfile](brew/fontfile)).

```sh
$ sh ./install-apps.sh
```

**5.** Tell Git who you are.
> I prefer doing it in a separate `gitlocal` file, which is included in my `gitconfig`.

```sh
$ git config -f ~/.gitlocal user.email "{Your email}"
$ git config -f ~/.gitlocal user.name "{Your name}"
```

**6.** Tell [npm](https://www.npmjs.com/) who you are.
```sh
$ npm set init.author.name "{Your name}"
$ npm set init.author.email "{Your email}"
$ npm set init.author.url "{Your URL}"
$ npm adduser
```

**7.**
Screen resolution has to be set manually

# thanks
[Diéssica Gurskas](https://github.com/diessic), [Holman](https://github.com/holman), [Mathias Bynens](https://github.com/mathiasbynens/dotfiles), [Deny Dias](https://github.com/denydias/dotfiles) and [this question](http://stackoverflow.com/questions/171563/whats-in-your-zshrc).

###### LICENSE
[![CC0](http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg)](http://creativecommons.org/publicdomain/zero/1.0/)