#!/bin/bash
#
# This source code is licensed under the GPLv2 or GPLv3 license.
# For additional details, refer to the LICENSE file located in the root
# directory of this source tree.
#

# update_repo <http://gh/repo/url> ["commands to do"]

declare -a array

function SPLIT()
    {
    SEP="$1"
    STR="$2"
    IFS="$SEP" read -ra array <<< "$STR"
    for i in "${array[@]}"; do
        : ;
    done
    }

REPO=
TAG=

NULL=/dev/null # "nul" for cygwin/msys
WGET=wget
WGETSO="wget -O-"
#WGETSO="curl -s"

update_repo()
    {
    repo_url="$1"
    shift
    SPLIT '/' "$repo_url"
    asize=${#array[@]}
    repo=${array[$(($asize-1))]}
    owner=${array[$(($asize-2))]}

    latest_tag=$( $WGETSO 2>$NULL "https://api.github.com/repos/$owner/$repo/releases/latest" \
        | grep -Po '"tag_name": *"\K.*?(?=")' )
    tag=${latest_tag##v}
    if [ -z "$tag" ]; then echo "Error: no latest_tag found."; exit 2; fi
    addr="${repo_url}/archive/refs/tags/${latest_tag}.zip"
    arch="${latest_tag}.zip"

    if [ ! -f "${repo}-${branch}.zip" ]; then
        $WGET "${addr}" && \
        mv $arch "${repo}-${tag}.zip"
    fi
    arch="${repo}-${tag}.zip"

    local dir="${repo}-${tag}"
    [ -d $dir ] || unzip -q "$arch"

    mkdir -p "$repo"

    REPO=$repo
    TAG=$tag
    for i in "$@"; do # commands
        cmd="$1"
        eval "$cmd"
        shift
    done && \
#        rm -Rf "$dir"
#        rm -f "$arch"
        :
    }

usage()
    {
    echo "update repos/codecs"
    echo "upd-repo <repository>"
    echo "example: cd lzbench/lz/ && sh ../build/upd-repos.sh zlib"
    echo "for available codecs refer to source of main loop"
    }


if [ $# -eq 0 ]
  then
  usage
  exit 1
fi


# main()
while [[ $# -gt 0 ]]; do
    case $1 in
        # update_repo https://github.com/user/repo repo master-branch "cp repo-master/*.c repo"
    "7-zip")
        update_repo https://github.com/ip7z/7zip 7zip main "cp 7zip-main/C/* 7-zip"
        ;;
    "bzip3")
        update_repo https://github.com/iczelia/bzip3 bzip3 master "cp -r bzip3-master/src bzip3" "cp -r bzip3-master/include bzip3" "cp bzip3-master/README.md bzip3"
        ;;
    "libdeflate")
        update_repo https://github.com/ebiggers/libdeflate libdeflate master "cp libdeflate-master/* libdeflate" "cp -r libdeflate-master/lib libdeflate"
        ;;
    "lz4")
        update_repo https://github.com/lz4/lz4 lz4 dev "cp -r lz4-dev/lib lz4" "rm -Rf lz4/lib/dll"
        ;;
    "snappy")
        update_repo https://github.com/google/snappy snappy main "cp snappy-main/* snappy"
        ;;
    "xz")
        update_repo https://github.com/tukaani-project/xz xz master "cp -r xz-master/src xz"
        ;;
    "zlib")
        echo "REPO=$REPO"
        echo "TAG=$TAG"
        update_repo https://github.com/madler/zlib "cp zlib-$TAG/* zlib"
        ;;
    "zlib-ng")
        update_repo https://github.com/zlib-ng/zlib-ng zlib-ng develop "cp zlib-ng-develop/*.c zlib-ng-develop/*.h zlib-ng" "cp -r zlib-ng-develop/arch zlib-ng" "cp -r zlib-ng-develop/README.md zlib-ng"
        ;;
    "zstd")
        update_repo https://github.com/facebook/zstd zstd dev "cp -r zstd-dev/lib zstd" "cp -r zstd-dev/README.md zstd" "cp -r zstd-dev/CHANGELOG zstd"
        ;;
    --all)
        $0 lz4 xz zlib zstd
        ;;
    --help)
        usage
        exit 0
        ;;
    *)
        echo "Unknown repo: $1"
        ;;
    esac
    shift
done

