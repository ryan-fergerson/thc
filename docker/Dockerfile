FROM alpine:3.14

RUN apk add --no-cache \
    curl \
    exa \
    fd \
    font-hack-nerd \
    fzf \
    git \
    neovim \
    neovim-doc \
    postgresql-client \
    rsync \
    tig \
    tmux \
    tzdata \
    zsh \
    zsh-vcs 

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd && \
    ln -s /usr/share/zoneinfo/America/New_York /etc/localtime

ADD campaigns /usr/local/bin/
ADD settings /root/

RUN nvim --headless +PlugInstall +qall

ENV PGUSER=test
ENV PGPASSWORD=123
ENV PGHOST=localhost
ENV PGDATABASE=sample

ENTRYPOINT ["tmux", "-u", "new", "-s", "DOCKER"]
