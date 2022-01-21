FROM pytorchlightning/pytorch_lightning:base-conda-py3.8-torch1.10

RUN pip install openslide-python opencv-contrib-python kornia staintools spams gpustat hydra-core albumentations timm torchstain submitit wandb
