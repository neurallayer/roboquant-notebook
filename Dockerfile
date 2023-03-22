# we use the smaller base-notebook image as a starting point
FROM jupyter/base-notebook:2023-03-13

# Install OpenJDK as root
USER root

# Install the OpenJDK 17 JRE headless runtime and libgomp
RUN apt-get update && apt-get install -y openjdk-17-jre-headless libgomp1

# Disable announcement pop-ups
RUN jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

# The remaining we run under the standard non-privileged user
USER 1000

# Install the Kotlin kernel in the Jupyter environment
# RUN pip install kotlin-jupyter-kernel==0.11.0.255
RUN pip install -i https://test.pypi.org/simple/ kotlin-jupyter-kernel==0.11.0.335

# Make additional Kotlin kernels available with different fixed memory profiles
RUN python -m kotlin_kernel add-kernel --name "Small_0.5GB" --jvm-arg=-Xmx512M
RUN python -m kotlin_kernel add-kernel --name "Medium_2G" --jvm-arg=-Xmx2G
RUN python -m kotlin_kernel add-kernel --name "Large_8GB" --jvm-arg=-Xmx8G

# Copy the notebooks to the home directory
RUN mkdir -p /home/jovyan/notebooks
COPY --chown=1000:100 notebooks /home/jovyan/notebooks

# Run the preload notebook to load some libraries and historic data on the image
RUN jupyter nbconvert --to notebook --execute notebooks/preload.ipynb && rm -f notebooks/preload*.ipynb




