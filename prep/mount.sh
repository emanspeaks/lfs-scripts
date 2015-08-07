#!/bin/bash

try mount -v -t ext4 /dev/md0p2 /mnt/lfs || /
  (echo "LFS failed to mount: $*"; exit 1)
