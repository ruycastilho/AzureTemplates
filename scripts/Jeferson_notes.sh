
# Mount the virtual file system
sudo mount -t cifs //test1diag281.file.core.windows.net/shared-fs mountpoint/ -o vers=3.0,username=test1diag281,password=gGEn7CeoUxlkf/EY6sUlrZFg4ebJw3ZkjJ0QvZ5viW0ES+bRDllVwLQy17M9PcWaM4PoRGhqycd9BFE7OadAqg==,dir_mode=0777,file_mode=0777,sec=ntlmssp

# Create a Singularity image with the apropriate size
singularity image.create -s 2048 mountpoint/Centos-7.img
# Pull the image from Docker preository
sudo singularity build --writable mountpoint/Centos-7.img docker://centos:7


mpirun -np 20 -hosts 10.0.0.4,10.0.0.5 singularity exec ~/mountpoint/ubuntu.img ~/mountpoint/matix_mul_mpi/matrix_mul