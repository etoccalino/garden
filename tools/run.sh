#! /bin/bash

# change to the root of the project
cd $(dirname $0)/..

# Build the exec image if it does not exist
if ! $(docker images garden:latest | grep -q garden) ; then
    echo "Building the docker image to serve the content..."
    docker build -t garden:latest .
fi

echo "Running the docker image to serve the content..."
docker run -it --rm -v $(pwd):/garden --net host garden:latest
