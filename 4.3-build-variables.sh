#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

clfs_user

build_line "i Setting up build variables .."
cat  > "${HOME}/.clfs_build_variables" << EOF
export CLFS_FLOAT="hard"
export CLFS_FPU="vfp"
export CLFS_HOST=$(echo $MACHTYPE | sed "s/-[^-]*/-cross/")
export CLFS_TARGET="arm-linux-musleabihf"
export CLFS_ARCH=arm
export CLFS_ARM_ARCH="armv6j"
EOF

echo ". ${HOME}/.clfs_build_variables" >> "${HOME}/.bashrc"
source "${HOME}/.clfs_build_variables"
