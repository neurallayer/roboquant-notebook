# we use the smaller base-notebook image as a starting point
FROM jupyter/base-notebook:lab-3.4.4

# Install OpenJDK as root
USER root

# Install the OpenJDK 17 JRE headless runtime
RUN apt-get update && apt-get install -y openjdk-17-jre-headless

# The remaining we run under the standard non-privileged user
USER 1000

# Install the Kotlin kernel in the Jupyter environment
# RUN conda install -y -c jetbrains-dev kotlin-jupyter-kernel
RUN conda install -y -c jetbrains kotlin-jupyter-kernel

# Make additional Kotlin kernels available with different memory profiles
RUN python -m kotlin_kernel add-kernel --name "SMALL 1GB" --jvm-arg=-Xmx1G
RUN python -m kotlin_kernel add-kernel --name "MEDIUM 4GB" --jvm-arg=-Xmx4G
RUN python -m kotlin_kernel add-kernel --name "LARGE 8GB" --jvm-arg=-Xmx8G
RUN python -m kotlin_kernel add-kernel --name "XLARGE 16GB" --jvm-arg=-Xmx16G

# Copy the notebooks to the home directory
RUN mkdir -p /home/jovyan/notebooks
COPY --chown=1000:100 notebooks /home/jovyan/notebooks

# Set default to dark theming
RUN mkdir -p /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/ && \
        echo '{ "theme":"JupyterLab Dark"}' > /home/jovyan/.jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings



