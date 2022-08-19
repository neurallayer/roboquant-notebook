[[ ! -f "LICENSE" ]] && echo "run the dockerbuild.sh script from the project root directory like this: ./bin/dockerbuild.sh" && exit -1

# New Docker builder that supports building for multi-architectures
# Run the following 3 lines once to enable the new builder
# docker buildx create --name mybuilder
# docker buildx use mybuilder
# docker buildx inspect --bootstrap

# Clean output cells of notebooks
cd notebooks
jupyter nbconvert --clear-output --inplace *.ipynb
cd ..

# Build for Intel and Apple Silicon
docker buildx build --platform linux/amd64,linux/arm64 -t roboquant/jupyter:latest --push .
