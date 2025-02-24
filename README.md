# .dotfiles
My personal dotfiles setup. Based off [glsignal's setup](https://github.com/glsignal/dotfiles).

---

To set up a new computer,

1. `git clone` this repo
2. remove any dotfiles currently in the home directory that you want to replace with these
3. `cd` into the repo and run `./setup.sh`
4. `⌘ + N` to start a new terminal instance. If it doesn't work you may need to restart your machine.

---

Actually, setting up a new machine is enough of a pain that I'm just going to document everything I'm doing to help my future self. (From me, 12 Jan 2025)

## 1. Install some warez

- Chrome & Firefox
- 1Password
- kitty
- Sublime Text

## 2. Rip through every control you got

Things to make sure to customise:
- Date and Time formats
- Language and Region
- Appearance (auto light/dark mode)
- Hide Dock/Taskbar
- Keyboard & Trackpad shortcuts
  - Don't forget three-finger drag

## 3. The dastardly chore of setting up your dev environment

1. Change default shell to zsh: `chsh -s $(which zsh)`
2. Clone and unpack my [dotfiles](https://github.com/heisenburger/.dotfiles) (see above)
3. Breathe a sigh of relief from the ugly
4. [Generate a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and then [add it to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account). Remember to [test the SSH connection first](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection).
5. Install [Homebrew](https://brew.sh/) with `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
6. Install GnuPG (pre-req for RVM) with `brew install gnupg gnupg2`
7. [Install RVM](https://rvm.io/rvm/install), then install the latest stable ruby. You might run into some errors with `make`. Try forcing the openssl version with `rvm install [x.x.x] --with-openssl-dir="$(brew --prefix openssl@3)"`. If that doesn't work, double check the path of openssl by running `which openssl`.
8. Become tired and give up until tomorrow

Still on my todos:
- Install Python... in a not weird way, somehow
- Fix the version checking for ruby and python in my login script
- Install All The Other Apps
