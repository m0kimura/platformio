FROM m0kimura/ubuntu-base

ARG user=${user:-docker}
RUN apt-get update \

##  GET PIP
&&  wget https://bootstrap.pypa.io/get-pip.py \
&&  chmod +x get-pip.py \
&&  ./get-pip.py \
&&  pip install -U pip setuptools \
&&  rm get-pip.py \

&&  pip install -U setuptools \
&&  pip install -U platformio \
&&  git clone https://github.com/platformio/platformio.git \
&&  cd etc/udev && mkdir rules.d && cd rules.d \
&&  cp /platformio/scripts/99-platformio-udev.rules * \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/*

COPY ./parts/template.ino /root/platformio.ino
RUN chown $user:$user /root/platformio.ino


##  USER
ENV HOME=/home/${user} USER=${user}
WORKDIR $HOME
USER $USER
##

COPY ./starter.sh /usr/bin/starter.sh
CMD starter.sh
