Docker NFS Server
================

sudo sed -i 's/STATDOPTS=/STATDOPTS="--port 32765 --outgoing-port 32766"/g' /etc/default/nfs-common
sudo sed -i 's/RPCMOUNTDOPTS="--manage-gids"/RPCMOUNTDOPTS="--manage-gids -p 32767"/g' /etc/default/nfs-kernel-server