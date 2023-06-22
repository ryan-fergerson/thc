# Tips Hacks Configuration

## Ideal workflow
* **Responsive** - fast feedback (keyboard shortcuts, helpful shell functions, window navigation, REPL)
* **Configurable** - easy to adjust for current task
* **Efficient** - minimal or mnemonic keystrokes, minimal mental overhead

## Overview
These are the various tools I use for creating applications locally.

## Environment
* **OS**: MacOS (13-inch, M1) - Linux (servers | [ubuntu](https://ubuntu.com), [fedora](https://fedoraproject.org))
* **Web browsers**: [Google Chrome](https://www.google.com/chrome/) - [Firefox](https://www.mozilla.org/en-US/firefox/new/)
* **Terminal**: [Alacritty](https://github.com/alacritty/alacritty)
* **Terminal Multiplexer (Sessions)**: [tmux](https://github.com/tmux/tmux/wiki)
* **Shell**: [zsh | ohmyzsh](https://ohmyz.sh/)
* **Editors**: [Neovim](https://neovim.io/) - [IntelliJ Idea](https://www.jetbrains.com/idea/)
* **Fonts**: [hack-nerd-font](https://github.com/ryanoasis/nerd-fonts) - [fira-code](https://github.com/tonsky/FiraCode) - [victor-mono](https://github.com/rubjo/victor-mono)
* **Application Containers**: [Docker](https://www.docker.com/)
* **Revision control**: [git](https://git-scm.com/)
* **Database**: [PostgreSQL](https://www.postgresql.org/)
* **IT automation**: [ansible ](https://www.ansible.com/)
* **curl replacement**: [httpie](https://github.com/httpie/httpie)
* **ls replacement**: [exa](https://github.com/ogham/exa)
* **find replacement**: [fd](https://github.com/sharkdp/fd)
* **Search (fuzzy file finder)**: [fzf](https://github.com/junegunn/fzf)

## Tools for productivity 
* Goals & Reflection (Daily · Monthly · Yearly · 5 years · 10 years)
* Calendar (time-specific only)
* Timer (promodo)
* GTD - Getting Things Done (centralized inbox)
  + Inbox zero (personal tasks)
* Task list (context based)
* Workspaces
* Window management
* Code Katas

## Inspiration
* [My Developer Workflow - How I use i3, tmux, and vim | ThePrimeagen (youtube video)](https://youtu.be/bdumjiHabhQ)
* [~/.dotfiles in 100 Seconds | Fireship (youtube video)](https://youtu.be/r_MpUP6aKiQ)
* [Habits of Efficient Developers • Daniel Lebrero Berna • GOTO 2020 (youtube video)](https://youtu.be/ZlnSxlF9V_c)

## Decommission Computer
Software audit:
- Uninstall unwanted software (e.g. GarageBand, iMovie, Keynote, Numbers, Pages)
- Install missing software (look at `/Applications`, panes in System Preferences , maybe `~/Applications`, etc.)

Backup / sync files:
- Commit and Push to remote repositories
- Manual Backups (external drives, redundant cloud services)
- Contacts, Photos, Calendar, Messages

Deactivate licenses:
- Sign Out of App Store (`Menu > Store > Sign Out`)
- iTunes, etc.

## Restore Instructions
1. `xcode-select --install` (Command Line Tools are required for Git and Homebrew)
3. `git clone https://github.com/ryan-fergerson/thc.git ~/code/thc`. We'll start with `https` but switch to `ssh` after everything is installed.
4. `cd ~/code/thc`
6. Do one last Software Audit by editing [Brewfile](tech/Brewfile) directly.
7. [`./install`](install)
8. Restart computer.
9. Setup cloud services (use multifactor authentication!) and allow files to sync before setting up dependent applications.
10. [Generate ssh key](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh), add to GitHub, and switch remotes.
    ```zsh
    # Generate SSH key in default location (~/.ssh/config)
    ssh-keygen -t rsa -b 4096 -C "github@r-f.dev"

    # Start the ssh-agent
    eval "$(ssh-agent -s)"

    # Create config file with necessary settings
    << EOF > ~/.ssh/config
    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_rsa
    EOF

    # Add private key to ssh-agent 
    ssh-add -K ~/.ssh/id_rsa

    # Copy public key and add to github.com > Settings > SSH and GPG keys
    pbcopy < ~/.ssh/id_rsa.pub

    # Switch from HTTPS to SSH
    git remote set-url origin git@github.com:ryan-fergerson/thc.git
    ```

### Manual Steps
#### MacOS settings
1. `System Preferences > Battery > Power Adapter > Prevent your Mac from automatically sleeping when the display is off`
2. `System Preferences > Security & Privacy > General > Require password 1 hour after sleep or screen saver begins`
3. `System Preferences > Touch ID > Add Fingerprint`
4. `System Preferences > Keyboard > Modifier Keys... > Control -> Command, Command -> Control`
5. `System Preferences > Sharing > Computer Name:`

