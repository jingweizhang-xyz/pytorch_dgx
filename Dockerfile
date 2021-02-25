FROM nvidia/cuda:9.2-cudnn7-runtime-ubuntu16.04

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

# Install some basic utilities
RUN apt-get update --fix-missing && apt upgrade -y && apt-get install -y \
    gcc \
    curl wget \
    ca-certificates \
    sudo \
    git subversion \
    bzip2 \
    libx11-6 \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    mercurial \
    htop zsh vim zip \
    python3-openslide \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Create a working directory
RUN mkdir /app
# WORKDIR /app


RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

# enable conda base
RUN . /opt/conda/etc/profile.d/conda.sh && \
    conda activate base

# CUDA 10.0-specific steps
RUN conda install -y -c pytorch torchvision torchaudio cudatoolkit=9.2 cudnn \
 && conda clean -ya

#
# RUN conda install -y -c conda-forge \
#     py-opencv \
#  && conda clean -ya

# 
RUN pip install openslide-python opencv-contrib-python pretrainedmodels kornia tensorboardX staintools spams

# setting up zsh using oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended \
    && sed -i 's/robbyrussell/kphoen/g' ~/.zshrc

# Set the default command to python3
CMD ["python3"]
