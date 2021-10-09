#!/usr/bin/env bash
echo "Update environment..."
apt update -q  &> /dev/null
echo "Install Java..."
apt-get install -q openjdk-11-jdk-headless &> /dev/null
echo "Install Jupyter Kotlin kernel..."
pip install kotlin-jupyter-kernel

# Right now Colab doesn't correctly work with newly installed kernels. But normally the following should do the trick
# !curl -O https://raw.githubusercontent.com/neurallayer/roboquant-notebook/main/bin/build_colab.sh && bash build_colab.sh

