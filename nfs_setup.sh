#!/bin/bash
set -e

sed -i 's/STATDOPTS=/STATDOPTS="--port 32765 --outgoing-port 32766"/g' /etc/default/nfs-common
sed -i 's/RPCMOUNTDOPTS="--manage-gids"/RPCMOUNTDOPTS="--manage-gids -p 32767"/g' /etc/default/nfs-kernel-server


mounts="${@}"

for mnt in "${mounts[@]}"; do
  src=$(echo $mnt | awk -F':' '{ print $1 }')
  echo "$src *(rw,sync,no_subtree_check,fsid=0,no_root_squash)" >> /etc/exports
done


exec runsvdir /etc/sv
