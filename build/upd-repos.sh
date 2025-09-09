#!/bin/sh
#
# This source code is licensed under the GPLv2 or GPLv3 license.
# For additional details, refer to the LICENSE file located in the root
# directory of this source tree.
#

# update_repo <http://gh/repo/url> <repo> <branch> ["commands to do"]
update_repo()
{
    local repo_url="$1"
    local repo="$2"
    local branch="$3"
    shift; shift; shift

    if [ ! -f "${repo}-${branch}.zip" ]; then
        wget "${repo_url}/archive/refs/heads/master.zip" && \
        mv master.zip "${repo}-${branch}.zip"
    fi
    local dir="${repo}-${branch}"
    [ -d $dir ] || unzip -q "${repo}-${branch}.zip"

    mkdir -p "$repo"

    #local cmd="$4"
    for i in "$@"; do
        cmd="$1"
        eval "$cmd"
        shift
    done && \
        rm -Rf "$dir"
        rm -f "${repo}-${branch}.zip"
        :
}

usage()
{
    echo "update repos/codecs"
    echo "upd-repo <repository>"
    echo "example: cd path/to/upd-repo zlib"
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
        update_repo https://github.com/madler/zlib zlib master "cp zlib-master/* zlib"
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

