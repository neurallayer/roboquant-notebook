#!/usr/bin/env bash
echo "Update environment..."
# apt update -q  &> /dev/null
# echo "Install Java..."
# apt-get install -q openjdk-11-jdk-headless &> /dev/null
echo "Install Jupyter Kotlin kernel..."
pip install openjdk kotlin-jupyter-kernel

