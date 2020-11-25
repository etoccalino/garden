# Depends on the `convert` program, imagemagik package

#! /bin/bash

cd $(dirname ${0})/../assets/img

# Create a directory to store the originals
TMP_DIR=$(mktemp -d)
echo "Storing original images in ${TMP_DIR}"

# Filter only images >= 1M
for IMAGE in $(ls -sh | grep "M " | cut -d\  -f 2) ; do
    echo "Scaling ${IMAGE}"
    D_IMAGE="${TMP_DIR}/$(basename ${IMAGE})"
    mv ${IMAGE} ${D_IMAGE}
    convert ${D_IMAGE} -scale 25% ${IMAGE}
done
