#!/bin/bash

# If the path is not passed as an argument, it will be set to the default value
IMAGE_FILE=$1
IMAGE_FILE="${IMAGE_FILE:-/home/username/mountpoint/Centos-7.img}"

# Print every single command before execute  # set+x disable it
set -x

# Include the appropriate development tools into the container (notice we are calling
# singularity as root and the container is writeable)
sudo singularity exec -w $IMAGE_FILE yum groupinstall "Development Tools"

# Clone the OpenMPI GitHub master branch in current directory (on host)
if [ ! -d ompi ]; then
	git clone https://github.com/open-mpi/ompi.git
fi
cd ompi

# Build OpenMPI in the working directory, using the tool chain within the container
singularity exec $IMAGE_FILE ./autogen.pl
singularity exec $IMAGE_FILE ./configure --prefix=/usr/local
singularity exec $IMAGE_FILE make

# Install OpenMPI into the container (notice now running as root and container is writeable)
sudo singularity exec -w -B /home $IMAGE_FILE make install

# Build the OpenMPI ring example and place the binary in this directory
singularity exec $IMAGE_FILE mpicc examples/ring_c.c -o ring

# Install the MPI binary into the container at /usr/bin/ring
# sudo singularity copy $IMAGE_FILE ./ring /usr/bin/

# Run the MPI program within the container by calling the MPIRUN on the host
mpirun -np 20 singularity exec $IMAGE_FILE ./ring
