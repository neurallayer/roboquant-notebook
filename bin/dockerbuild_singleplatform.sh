[[ ! -f "LICENSE" ]] && echo "run the dockerbuild script from the project root directory like this: ./docker/dockerbuild.sh" && exit -1


# Clean output cells of notebooks
cd tutorials
jupyter nbconvert --clear-output --inplace *.ipynb
cd ..

# Build for local platform only
docker build -t roboquant/jupyter:latest -f docker/Dockerfile .
