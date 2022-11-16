FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel
#FROM nvcr.io/nvidia/pytorch:22.04-py3

RUN apt-get update && apt install -y htop zsh openslide-tools vim git unzip zip libturbojpeg libvips dos2unix ffmpeg libsm6 libxext6 && apt-get clean

RUN conda install h5py numba ninja -y

RUN conda install -c conda-forge nvidia-apex -y

RUN pip install pandas openslide-python opencv-contrib-python kornia gpustat pytorch-lightning torchmetrics hydra-core albumentations timm==0.4.9 torchstain submitit wandb tqdm tensorboardX matplotlib scipy scikit-image scikit-learn jpeg4py pyvips pyyaml yacs einops psutil simplejson termcolor openmim faiss-gpu terminaltables codecov flake8 isort pytest pytest-cov pytest-runner xdoctest kwarray

#prefetch_generator

#RUN git clone https://github.com/NVIDIA/apex && cd apex && pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./ && cd .. && rm -rf apex

RUN mim install mmcv-full
#RUN pip install mmsegmentation
#RUN git clone https://github.com/open-mmlab/mmsegmentation.git && cd mmsegmentation && pip install -v -e . && cd .. && rm -rf mmsegmentation
RUN python -m pip install 'git+https://github.com/facebookresearch/detectron2.git'

