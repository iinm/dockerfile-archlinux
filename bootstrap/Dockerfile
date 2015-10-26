FROM scratch
ADD bootstrap.tar.xz /
COPY mirrorlist /etc/pacman.d/mirrorlist
RUN pacman-key --init && pacman-key --populate archlinux \
  && pacman -Syyu --noconfirm \
  && rm -rfv /var/cache/pacman/pkg/*