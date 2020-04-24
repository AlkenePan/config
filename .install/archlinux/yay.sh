set -e
cd /tmp
git clone https://github.com/Jguer/yay.git
cd yay
export GOPROXY=https://goproxy.cn
makepkg -si
