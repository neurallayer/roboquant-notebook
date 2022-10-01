#!/bin/bash

[[ ! -f "LICENSE" ]] && echo "run the script from the project root directory like this: ./bin/clean_notebooks.sh" && exit 1

jupyter nbconvert --clear-output --inplace ./notebooks/*.ipynb

