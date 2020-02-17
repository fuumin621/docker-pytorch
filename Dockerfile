FROM pytorch/pytorch

# install basic dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    sudo git wget cmake nano vim gcc g++ zip unzip tmux build-essential ca-certificates software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN pip install numpy pandas sklearn albumentations  geffnet pretrainedmodels pyarrow opencv-contrib-python \
    jupyter jupyterlab feather-format kaggle

#install open-cv
RUN apt-get update && apt-get install -y libglib2.0-0 libsm6 libxrender1 libxext6

# set working directory
WORKDIR /root/user

# config and clean up
RUN ldconfig \
&& apt-get clean \
&& apt-get autoremove

