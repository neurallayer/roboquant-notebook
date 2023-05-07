#!/bin/bash

[[ ! -f "LICENSE" ]] && echo "run the script from the project root directory like this: ./bin/run_notebooks.sh" && exit 1

rm -f notebooks/*.nbconvert.ipynb
rm -f notebooks/error.log

for notebook in backtest charts empty policies strategies tech-analysis basic yahoo forex dataframes
do
  echo "****** running $notebook ********" >> notebooks/error.log
  jupyter nbconvert --to notebook --execute "./notebooks/$notebook.ipynb" 2>> notebooks/error.log
done

rm -f notebooks/*.nbconvert.ipynb
grep -i exception notebooks/error.log && echo "Found exceptions" && exit 1
rm notebooks/error.log
