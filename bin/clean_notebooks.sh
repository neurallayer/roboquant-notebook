#!/bin/bash

[[ ! -f "LICENSE" ]] && echo "run the script from the project root directory like this: ./bin/clean_notebooks.sh" && exit 1

# Clear the output cells in all the notebooks. This should be done before they are
# being checked-in git
jupyter nbconvert --clear-output --inplace ./notebooks/*.ipynb

