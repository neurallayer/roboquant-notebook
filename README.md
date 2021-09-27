# roboquant notebook

[![APL v2](https://img.shields.io/badge/license-Apache%202-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?filepath=tutorials)
![GitHub issues](https://img.shields.io/github/issues/neurallayer/roboquant-notebook)
![GitHub last commit](https://img.shields.io/github/last-commit/neurallayer/roboquant-notebook)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/neurallayer/roboquant-notebook)

![roboquant Logo](/docs/roboquant_jupyter_logo.png)

This repository contains a number of Jupyter notebook tutorials that demonstrate key capabilities of roboquant. The following picture shows one of the many available charts within the notebook environment. 

![Jupyter Lab](/docs/jupyter-lab.png)

This repository also contains the build script to generate a Docker image that makes it easy to run the Jupyter Notebooks on your local machine. This Docker image is published on Docker Hub, so you actually don't need to build the Docker Image unless you want to make changes. You can find out much more about the roboquant at **[roboquant.org](https://roboquant.org)** 

## Run notebooks
If you prefer, you can run the tutorials without installing anything on your local machine by just clicking the following link [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?filepath=tutorials)

It might take some time before the MyBinder environment is set up, and you can run the notebooks. This is mainly due to the limited resources that these free environments have available and the fact that Java/Kotlin isn't included in the default environment and needs to be installed first.   

Alternatively you can run a docker container on your local machine that has all the tutorials included and will automatically spin-up a jupyter-lab environment:

```shell
docker run --rm -p 8888:8888 roboquant/jupyter 
```

## Included tutorials
The following tutorials are included and if you click on one of the notebook names below, the notebook will be automatically opened on MyBinder.org:

- [visualization.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?filepath=tutorials/visualization.ipynb) - Shows the charting capabilities of roboquant
- [alpaca.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?filepath=tutorials/alpaca.ipynb) - Shows the integration with Alpaca broker
- [binance.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?filepath=tutorials/binance.ipynb) - Shows the integration with Binance crypto exchange
- [crypto.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?filepath=tutorials/crypto.ipynb) - Shows the integration with many crypto exchange using the XChange library 
- [custom_strategies.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?filepath=tutorials/custom_strategies.ipynb) - How to develop a custom strategy
- [iex_cloud.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?filepath=tutorials/iex_cloud.ipynb) - Shows the integration with IEX Cloud data provider
- [introduction.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?filepath=tutorials/introduction.ipynb) - High level introduction
- [technical_analysis.ipynb](https://mybinder.org/v2/gh/neurallayer/roboquant-notebook/main?filepath=tutorials/technical_analysis.ipynb) - How to develop technical analysis strategies quickly 
- dotenv - Not a tutorial but an example environment file that can hold keys and secrets that are often required to connect to third party data providers and brokers

