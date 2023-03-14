[[ ! -f "LICENSE" ]] && echo "run the script from the project root directory like this: ./bin/dockerbuild.sh" && exit 1

# New Docker builder that supports building for multi-architectures
# Run the following 3 lines once to enable the new builder
# docker buildx create --name mybuilder
# docker buildx use mybuilder
# docker buildx inspect --bootstrap

# Clean output cells of notebooks
rm -f notebooks/*.nbconvert.ipynb
jupyter nbconvert --clear-output --inplace notebooks/*.ipynb

# Build for AMD64 and ARM64 platforms
docker buildx build --platform linux/amd64,linux/arm64/v8 -t roboquant/jupyter:1.1.1 --push .
