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
        :
    done
    }

function check_dir_and_cont()
    {
    dir="$1"
    if [ ! -d "$dir" ]; then
        read -sp "(codec) directory \'$dir\' not found. Continue anyway? [y/N] " yes_no
        if [ $yes_no == "y" ] || [ $yes_no == "Y" ] || [ $yes_no == "yes" ] || [ $yes_no == "YES" ]; then
            :
        else
            exit 2
        fi
    fi
    }

KEEP=

ADDR=
REPO=
TAG=
ARCH=

NULL=/dev/null # "nul" for cygwin/msys; /dev/stderr if you want see progress output
NULL=/dev/stderr
WGET=wget
WGETSO="wget -O-"
#WGETSO="curl -s"

update_tag()
    {
    repo_url="$1"
    ADDR="$repo_url"
    SPLIT '/' "$repo_url"
    asize=${#array[@]}
    REPO=${array[$(($asize-1))]}
    OWNER=${array[$(($asize-2))]}

    latest_tag=$( $WGETSO "https://api.github.com/repos/$OWNER/$REPO/releases/latest" 2>$NULL \
        | grep -Po '"tag_name": *"\K.*?(?=")' )
    TAG=${latest_tag##v}
    if [ -z "$TAG" ]; then echo "Error: latest_tag not found."; return 2; fi
    ARCH="${repo_url}/archive/refs/tags/${latest_tag}.zip"
    }

update_repo()
    {
    echo "update_repo()"
    repo_url="$1"
    shift

    if [ -z $TAG ]; then
        update_tag "$1" || echo "latest_tag not found" && exit 2
    fi
    arch="$REPO-$TAG.zip"

    if [ ! -f "$arch" ]; then
        $WGETSO "${ARCH}" > $arch 2>$NULL
    fi

    local dir="${REPO}-${TAG}"
    [ -d $dir ] || unzip -q "$arch"

    mkdir -p "$REPO"

    for i in "$@"; do # commands
        cmd="$1"
        eval "$cmd"
        shift
    done && \
    if [ -z $KEEP ]; then
        rm -Rf "$dir"
        rm -f "$arch"
    fi
    :
    }

usage()
    {
    cat << EOF
update bench repos/codecs
upd-repo [option] <repository>
    options:
    --keep    keep temporary files/directories
    --help    print help screen
    for available codecs refer to source of main loop

example:
    cd lzbench/lz/ && bash ../build/upd-repos.sh zlib
EOF
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
        check_dir_and_cont 7-zip
        update_tag https://github.com/ip7z/7zip
        update_repo $ADDR "cp 7zip-$TAG/C/* 7-zip"
        ;;
    "bzip3")
        check_dir_and_cont bzip3
        update_tag https://github.com/iczelia/bzip3
        update_repo $ADDR "cp -r bzip3-$TAG/src bzip3" "cp -r bzip3-$TAG/include bzip3" "cp bzip3-$TAG/README.md bzip3"
        ;;
    "libdeflate")
        check_dir_and_cont libdeflate
        update_tag https://github.com/ebiggers/libdeflate
        update_repo $ADDR "cp libdeflate-$TAG/* libdeflate" "cp -r libdeflate-$TAG/lib libdeflate"
        ;;
    "lz4")
        check_dir_and_cont lz4
        update_tag https://github.com/lz4/lz4
        update_repo $ADDR "cp -r lz4-$TAG/lib lz4" "rm -Rf lz4/lib/dll"
        ;;
    "snappy")
        check_dir_and_cont snappy
        update_tag https://github.com/google/snappy
        update_repo $ADDR "cp snappy-$TAG/* snappy"
        ;;
    "xz")
        check_dir_and_cont xz
        update_tag https://github.com/tukaani-project/xz
        update_repo $ADDR "cp -r xz-$TAG/src xz"
        ;;
    "zlib")
        check_dir_and_cont zlib
        update_tag https://github.com/madler/zlib
        update_repo $ADDR "cp zlib-$TAG/* zlib"
        ;;
    "zlib-ng")
        check_dir_and_cont zlib-ng
        update_tag https://github.com/zlib-ng/zlib-ng
        update_repo $ADDR "cp zlib-ng-$TAG/*.c zlib-ng-$TAG/*.h zlib-ng" "cp -r zlib-ng-$TAG/arch zlib-ng" "cp -r zlib-ng-$TAG/README.md zlib-ng"
        ;;
    "zstd")
        check_dir_and_cont zstd
        update_tag https://github.com/facebook/zstd
        update_repo $ADDR "cp -r zstd-$TAG/lib zstd" "cp -r zstd-$TAG/README.md zstd" "cp -r zstd-$TAG/CHANGELOG zstd"
        ;;
    --keep)
        KEEP="1"
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

