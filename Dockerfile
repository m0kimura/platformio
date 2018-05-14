FROM m0kimura/ubuntu-base

ARG user=${user:-docker}
RUN apt-get update \
&&  apt-get install -y gtkterm libcanberra-gtk-module libcanberra-gtk3-module curl \

##  GET PIP
&&  echo "getpip" \
&&  wget https://bootstrap.pypa.io/get-pip.py \
&&  chmod +x get-pip.py \
&&  ./get-pip.py \
&&  pip install -U pip setuptools \
&&  rm get-pip.py \

&&  pip install -U setuptools \
&&  pip install -U platformio \
&&  git clone https://github.com/platformio/platformio.git \
&&  cd etc/udev && mkdir rules.d && cd rules.d \
&&  cp /platformio/scripts/99-platformio-udev.rules /etc/udev/rules.d/99-platformio-udev.rules \
&&  usermod -a -G dialout ${user} \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*
COPY ./parts/template.ino /usr/share/platformio.ino
COPY ./README.md /usr/share/README.md
##  USER
ENV HOME=/home/${user} USER=${user}
WORKDIR $HOME
USER $USER
##
#@module starter 標準的な開始処理対応(starterの扱い)
#@desc 準備されたスターターは自動的に呼び出されます。　起動引数を意識してstarterを作ります。
COPY ./starter.sh /usr/bin/starter.sh
ENTRYPOINT ["starter.sh"]
CMD ["none"]
##
