[[ ! -f "LICENSE" ]] && echo "run the dockerbuild script from the project root directory like this: ./docker/dockerbuild.sh" && exit -1

# Traditional docker build
# docker build -t roboquant/jupyter:latest -f docker/Dockerfile .

# New Docker builder that supports building for multi-architectures
# Run the following 3 lines once to enable the new builder
# docker buildx create --name mybuilder
# docker buildx use mybuilder
# docker buildx inspect --bootstrap

# Build for Intel and Apple Silicon
docker buildx build --platform linux/amd64,linux/arm64 -t roboquant/jupyter:latest -f docker/Dockerfile --push .