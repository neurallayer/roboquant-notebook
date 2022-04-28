# Latest version of base-notebook:lab uses an Ubuntu version that cannot install JRE 17 due to issues when installing
# Java certificates, so for now we stay on 3.2.9
FROM jupyter/base-notebook:lab-3.2.9

USER root

# Install the OpenJDK 17 JRE runtime
RUN apt-get update && apt-get install -y openjdk-17-jre-headless

# The remaining we run under the standard user
USER 1000

# Install the Kotlin kernel in the Jupyter environment
# RUN conda install -y -c jetbrains-dev kotlin-jupyter-kernel
RUN conda install -y -c jetbrains kotlin-jupyter-kernel

# Make additional Kotlin kernels available with different memory profiles
RUN python -m kotlin_kernel add-kernel --name "SMALL 1GB" --jvm-arg=-Xmx1G
RUN python -m kotlin_kernel add-kernel --name "MEDIUM 4GB" --jvm-arg=-Xmx4G
RUN python -m kotlin_kernel add-kernel --name "LARGE 8GB" --jvm-arg=-Xmx8G
RUN python -m kotlin_kernel add-kernel --name "XLARGE 16GB" --jvm-arg=-Xmx16G

# Install the json files for the %use roboquant line magic to work
# COPY --chown=1000:100 docker/assets/roboquant.json  /opt/conda/lib/python3.9/site-packages/run_kotlin_kernel/libraries/

# Copy the tutorial notebooks and sample data to the home directory
RUN mkdir -p /home/jovyan/tutorials
COPY --chown=1000:100 tutorials /home/jovyan/tutorials
# COPY --chown=1000:100 data /home/jovyan/tutorials/data

# Some theming
RUN mkdir -p /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/ && \
        echo '{ "theme":"JupyterLab Dark"}' > /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings



