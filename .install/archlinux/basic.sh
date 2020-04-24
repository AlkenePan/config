set -e
rm -fr /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux

pacman -Syu --noconfirm
pacman -S --noconfirm base base-devel \
    linux-headers man-pages \
    curl wget httpie \
    the_silver_searcher awk \
    zip unzip \
    net-tools openssh \
    git \
    neovim emacs \
    go python \
    llvm ccls \
    fish

pacman -Scc --noconfirm
