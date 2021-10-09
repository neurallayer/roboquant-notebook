# Roboquant Notebook

[![APL v2](https://img.shields.io/badge/license-Apache%202-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?urlpath=lab/tree/tutorials)
![GitHub issues](https://img.shields.io/github/issues/neurallayer/roboquant-notebook)
![GitHub last commit](https://img.shields.io/github/last-commit/neurallayer/roboquant-notebook)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/neurallayer/roboquant-notebook)

![roboquant Logo](/assets/roboquant_jupyter_logo.png)

This repository contains a number of Jupyter Notebook tutorials that demonstrate key capabilities of roboquant. The following picture shows one of the many available charts within the notebook environment. 

![Jupyter Lab](/assets/jupyter-lab.png)

This repository also contains the build script to generate a Docker image that makes it easy to run the Jupyter Notebooks on your local machine. This Docker image is published on Docker Hub, so you actually don't need to build the Docker Image unless you want to make changes. You can find out much more about the roboquant at **[roboquant.org](https://roboquant.org)** 

## Run Jupyter Notebooks
If you prefer, you can run the tutorials without installing anything on your local machine by just clicking the following link [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?urlpath=lab/tree/tutorials)

It might take some time before the MyBinder environment is set up, and you can run the notebooks. This is mainly due to the limited resources that these free environments have available and the fact that the Kotlin kernel isn't included in the default environment and needs to be installed first.   

Alternatively you can run a Docker container on your local machine that has all the tutorials included and will automatically spin-up a Jupyter Lab environment:

```shell
docker run --rm -p 8888:8888 roboquant/jupyter 
```

And if you prefer the classic Jupyter environment instead of Jupyter Lab, you can run the following command:

```shell
docker run --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB="" roboquant/jupyter
```

### IBKR only
If you also want test the Interactive Brokers Notebook that is included, it is important to realize that the notebook requires access to a local running instance of Trader Workstation or IB Gateway. 

For the docker container to have this network access accessible, you can use the ```--network=host``` flag. This will spin up the container without an isolated virtual network.

```shell
docker run --rm -p 8888:8888 --network=host -roboquant/jupyter
```

## Included Tutorials
The following tutorials are included and if you click on one of the notebook names below, the notebook will be automatically opened on MyBinder.org:

- [visualization.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?urlpath=lab/tree/tutorials/visualization.ipynb) - Shows the charting capabilities of roboquant
- [alpaca.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?urlpath=lab/tree/tutorials/alpaca.ipynb) - Shows the integration with Alpaca broker
- [binance.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?urlpath=lab/tree/tutorials/binance.ipynb) - Shows the integration with Binance crypto exchange
- [crypto.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?urlpath=lab/tree/tutorials/crypto.ipynb) - Shows the integration with many crypto exchange using the XChange library 
- [custom_strategies.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?urlpath=lab/tree/tutorials/custom_strategies.ipynb) - How to develop a custom strategy
- [iex_cloud.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?urlpath=lab/tree/tutorials/iex_cloud.ipynb) - Shows the integration with IEX Cloud data provider
- [introduction.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?urlpath=lab/tree/tutorials/introduction.ipynb) - High level introduction
- [technical_analysis.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?urlpath=lab/tree/tutorials/technical_analysis.ipynb) - How to develop technical analysis strategies quickly 
- dotenv - Not a tutorial but an example environment file that can hold keys and secrets that are often required to connect to third party data providers and brokers

> Please note that the Interactive Brokers tutorial cannot be run on MyBinder.org since it requires a local running Trader Workstation or IB Gateway that is already authenticated. 

## Build Docker Image
You can also build the Docker image from the source. First thing to do is to clone the roboquant-notebook GitHub repository to your local disk. Then run the build script from the repository root directory:

```shell
./docker/dockerbuild.sh
```

The build script has been tested and used with [Podman](https://podman.io/), but should also work with Docker. 

## Contributions
Contributions are greatly appreciated. This can be a fix or enhancement to one of the existing tutorials or a completely new tutorial. The best way to do so is to raise an issue on GitHub and afterwards a PR.