#!/bin/bash

SCRIPTDIR="$(dirname "${0}")"
. "${SCRIPTDIR}/_common.sh"

declare -A SOURCES=(
  ["https://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.bz2"]=2869c9bf3e60ee97c74ac2a6bf4e9d68
  ["http://busybox.net/downloads/busybox-1.24.2.tar.bz2"]=2eaae519cac1143bcf583636a745381f
  ["https://gcc.gnu.org/pub/gcc/releases/gcc-6.2.0/gcc-6.2.0.tar.bz2"]=9768625159663b300ae4de2f4745fcc4
  ["https://ftp.gnu.org/gnu/gmp/gmp-6.1.1.tar.bz2"]=4c175f86e11eb32d8bf9872ca3a8e11d
  ["http://sethwklein.net/iana-etc-2.30.tar.bz2"]=3ba3afb1d1b261383d247f46cb135ee8
  ["http://www.kernel.org/pub/linux/kernel/v4.x/linux-4.9.22.tar.xz"]=b6390b3abc02ef4986644fb7051b4568
  ["https://ftp.gnu.org/gnu/mpc/mpc-1.0.3.tar.gz"]=d6a1d5f8ddea3abd2cc3e98f58352d26
  ["https://ftp.gnu.org/gnu/mpfr/mpfr-3.1.4.tar.bz2"]=b8a2f6b0e68bef46e53da2ac439e1cf4
  ["http://www.musl-libc.org/releases/musl-1.1.16.tar.gz"]=ac52ccaec6b06ab0f289d37e8436859b
  ["https://ftp.gnu.org/gnu/wget/wget-1.19.1.tar.xz"]=d30d82186b93fcabb4116ff513bfa9bd
  ["https://zlib.net/zlib-1.2.11.tar.xz"]=85adef240c5f370b308da8c938951a68
  ["https://www.openssl.org/source/openssl-1.1.0g.tar.gz"]=ba5f1b8b835b88cadbce9b35ed9531a6
)

build_line "i Fetching sources .."

for URL in "${!SOURCES[@]}"; do
  download_package "${URL}" "${SOURCES[${URL}]}"
done

build_line "i Fetching bootscripts"
wget --quiet -O "${CLFS}/sources/bootscripts-embedded.tar.gz" "http://git.clfs.org/?p=bootscripts-embedded.git;a=snapshot;h=HEAD;sf=tgz"

build_line "i Fetching cacert.pem"
wget --quiet -O "${CLFS}/sources/cacert.pem" "https://curl.haxx.se/ca/cacert.pem"
