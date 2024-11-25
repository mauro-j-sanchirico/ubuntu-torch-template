# ubuntu-torch-template
Template project for using torch in an Ubuntu development container.


CUDA:
https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html
https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html
https://developer.nvidia.com/cuda-downloads

Docker Desktop:
https://www.docker.com/blog/getting-started-with-docker-desktop/

GPU support in Docker Desktop
https://docs.docker.com/desktop/features/gpu/


WSL 2:
https://learn.microsoft.com/en-us/windows/wsl/install

NVIDIA Container Toolkit (which is already included in Windows’ Docker Desktop; Linux users have to install it)
https://github.com/NVIDIA/nvidia-container-toolkit
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html


    "postCreateCommand": "sudo bash .devcontainer/configure_cuda.sh",

https://developer.nvidia.com/ngc/nvidia-deep-learning-container-license