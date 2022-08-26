#!/bin/bash

[[ ! -f "LICENSE" ]] && echo "run the script from the project root directory like this: ./bin/run_notebooks.sh" && exit 1

rm -f notebooks/*.nbconvert.ipynb

for notebook in backtest charts policies strategies tech-analysis
do
  jupyter nbconvert --to notebook --execute "./notebooks/$notebook.ipynb"
done