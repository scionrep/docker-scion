FROM scioncc/scion_python:1.0
MAINTAINER Michael Meisinger <michael.meisinger@gmail.com>

ENV HOME=/root BIN_DIR=/root/bin GIT_REV=master CODE_DIR=$HOME/code SCION_DIR=$HOME/code/scioncc
WORKDIR $HOME

ADD build $HOME
RUN chmod -R +x $BIN_DIR

RUN bash $BIN_DIR/setup_base.sh

RUN bash $BIN_DIR/setup_code.sh

RUN bash $BIN_DIR/setup_install.sh

ADD run $HOME
RUN chmod -R +x $BIN_DIR
RUN cp $BIN_DIR/my_init.d/* /etc/my_init.d/

EXPOSE 4000 8080
