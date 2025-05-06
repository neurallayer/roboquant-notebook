[[ ! -f "LICENSE" ]] && echo "run the  script from the project root directory like this: ./bin/dockerbuild_singleplatform.sh" && exit 1

# Clean output cells of notebooks
rm -f notebooks/*.nbconvert.ipynb
jupyter nbconvert --clear-output --inplace notebooks/*.ipynb

# Build for the local architecture platform only
docker build -t roboquant/jupyter:2.2.0 -t roboquant/jupyter:latest .
