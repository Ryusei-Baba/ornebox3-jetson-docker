FROM masakifujiwara1/box3_humble:1119-tsukuba-run

WORKDIR /home
ENV HOME /home

ARG UID=1000

# install
RUN apt-get update && apt-get install -y vim git lsb-release sudo gnupg htop gedit tmux

# set shell
SHELL ["/bin/bash", "-c"]

# set ros2 workspace
COPY config/git_clone.sh /home/git_clone.sh
RUN . /opt/ros/humble/install/setup.sh
RUN mkdir -p ~/ros2_ws/src && cd ~/ros2_ws && colcon build
RUN cd ~/ros2_ws/src && . /home/git_clone.sh
RUN . /opt/ros/humble/install/setup.sh && cd ~/ros2_ws && colcon build --symlink-install
RUN source /opt/ros/humble/install/setup.bash && source ~/ros2_ws/install/local_setup.bash
RUN apt-get install bash-completion
RUN source /etc/bash_completion

COPY config/.bashrc ~/.bashrc
COPY config/.vimrc ~/.vimrc
