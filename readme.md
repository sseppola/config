## First and foremost
This was copied and then tweaked from [Diéssica Gurskas' dotfiles](https://github.com/diessica/dotfiles), big thanks to her and everyone she followed.
## Setup

```
# Step: Run the install script (downloads and installs everything)
curl -L https://raw.githubusercontent.com/sseppola/config/master/install.sh | sh

# Step: Restart machine

# Step: Configure apps
# 0. Connect 1 Password
# 1. Set Terminal Profile manually to Monokai
# 2. Set Alfred's preference directory
# 3. Open Firefox and connect sync
# 4. Set up .gitlocal and signing with ssh key (TODO: write a guide)
# 5. Configure touch pad
#    - Exposé with 3 fingers down
#    - Swipe page with 3 fingers
#    - Swipe full screen apps with 4 fingers
```

## Note
Not every file in this repository is being directly used. Some files, such as editor settings, are here for backup purposes.

## TODOS:
 - [ ] Simplify and restructure like https://github.com/paulmillr/dotfiles
   - Current scripts throw a fit and requires a lot of manual work
 - [ ] https://github.com/technicalpickles/homesick
 - [ ] Keybindings (eg. Alfred)
   - [ ] Essentials: Firefox, 1Password, VS Code, iTerm 2, setup SSH with Github
     - [ ] Alfred needs to be installed before dotfiles

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