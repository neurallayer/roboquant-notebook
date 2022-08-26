[[ ! -f "LICENSE" ]] && echo "run the  script from the project root directory like this: ./bin/dockerbuild_singleplatform.sh" && exit 1


# Clean output cells of notebooks
cd notebooks
jupyter nbconvert --clear-output --inplace *.ipynb
cd ..

# Build for local platform only
docker build -t roboquant/jupyter:latest .
