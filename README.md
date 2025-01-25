# Ubuntu Torch Template

This is a template project for using `torch` in an Ubuntu development container for academic research projects.

<div align="center">
<img src="https://repository-images.githubusercontent.com/893476283/fb713511-1b27-4cb4-81c0-f7c44623cf32" alt="Alt Text" width="600">
</div>

## Description

This template project provides a typical Python project folder structure with Poetry dependency management. An Ubuntu-based development container is provided with GPU passthrough configured.

## Installation

### Cloning

Cloning with HTTPS inherits the host machine's Git credentials for most hosts.

If cloning with SSH is desired, follow the instructions [here](https://code.visualstudio.com/remote/advancedcontainers/sharing-git-credentials) to enable securely forwarding SSH credentials from the host to the container.

### Installation with VS Code

Open VS Code in the cloned repository. Use `Cmd` / `Ctrl` + `Shift` + `P` &rarr; `"Dev Containers: Rebuild and Reopen in Container"`.

A `configure_environment.sh` script will run to generate the `developer` account and install basic packages.

Once attached to the container, a `post_attach.sh` script will run to configure Poetry and install the project.

### Codespaces Support

The container encapsulates several large dependencies for an easy, quick start, development experience for academic projects not constrained by container size. Codespaces might not provide enough memory to run the container. Local use with Docker Desktop is recommended.

## Usage

The `projectname` directory includes files to start a Python project.

The Poetry virtual environment is stored in the project in `.venv`. The local Python in the virtual environment is aliased to `localpy` for convenience. This Python should have all dependencies installed, including `torch` with GPU support.

### Adding Python Dependencies

Add Python dependencies with Poetry.

```bash
poetry add mpmath
```

### Examples

An example script is provided which loads Python dependencies and prints their versions.

```bash
localpy projectname/example.py
```

An example notebook, `projectname/example.ipynb`, is provided that performs the same function. Open it in VS Code. Select the `.venv (Python #.#.#)` environment corresponding to the version of `localpy`.

An example notebook, `projectname/torch.ipynb`, to confirm `torch` is working properly is also provided.

## Host Dependencies

The following host machine dependencies are required. The configuration scripts automate installation of all dependencies inside the container.

### Docker

[Docker Desktop](https://www.docker.com/blog/getting-started-with-docker-desktop/) is required to use the development container. Docker Desktop must be configured for [GPU support](https://docs.docker.com/desktop/features/gpu/).

### Windows Subsystem For Linux 2

Windows hosts need [Windows Subsystem for Linux 2 (WSL 2)](https://learn.microsoft.com/en-us/windows/wsl/install).

### Nvidia Container Toolkit

The Nvidia Container Toolkit is required for GPU passthrough. Windows Docker Desktop installations include it by default. Other host operating systems need to follow the [installation instructions](https://github.com/NVIDIA/nvidia-container-toolkit
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html).

### CUDA Drivers

The host machine must have CUDA drivers installed. Learn more at the following links.

* [CUDA Quick Start Guide](https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html)
* [CUDA Installation Guide for Windows](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html)
* [CUDA Downloads](https://developer.nvidia.com/cuda-downloads)

## License

Code in this repository is provided under the MIT license. See the `LICENSE` file.

## Container License

The development container in this repository is built from an Nvidia deep learning container image and subject to the [Nvidia Deep Learning Container License](https://developer.nvidia.com/ngc/nvidia-deep-learning-container-license).

## Contributing

Please email Mauro J. Sanchirico III [sanchirico.mauro@gmail.com](sanchirico.mauro@gmail.com) with questions, comments, bug reports, or suggestions.
