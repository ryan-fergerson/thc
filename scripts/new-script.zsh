#!/usr/bin/env zsh

echo ""
echo "███╗   ██╗███████╗██╗    ██╗    ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗"
echo "████╗  ██║██╔════╝██║    ██║    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝"
echo "██╔██╗ ██║█████╗  ██║ █╗ ██║    ███████╗██║     ██████╔╝██║██████╔╝   ██║   "
echo "██║╚██╗██║██╔══╝  ██║███╗██║    ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   "
echo "██║ ╚████║███████╗╚███╔███╔╝    ███████║╚██████╗██║  ██║██║██║        ██║   "
echo "╚═╝  ╚═══╝╚══════╝ ╚══╝╚══╝     ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   "
                                                                            
vared -cp 'name: ' name

# create new file with execute permissions using new-script-template.zsh
install $HOME/.local/bin/new-script-template.zsh $HOME/.local/bin/$name.zsh

# open new script in nvim
tmux neww nvim $HOME/.local/bin/$name.zsh

