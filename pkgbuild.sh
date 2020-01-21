#!/bin/bash

set -ex

# Environment variables.
makepkg_conf="/home/pkguser/.makepkg.conf"
if [ ! -f ${makepkg_conf} ] || ! $(grep -Fxq "PACKAGER" ${makepkg_conf}) ; then
# echo "No makepkg.conf or no PACKAGER variable found: exporting it..."
  export PACKAGER="${1/\// } <${2}@travis.build.id>"
fi
export AURDEST="$(pwd)/src"

# Variables declaration.
declare -r pkgrepo="${1#*/}"
declare -a pkglist=()
declare -a pkgkeys=()
declare -a pkgdeps=()

# Remove comments or blank lines.
for pkgfile in "pkglist" "pkgkeys"; do
  sed -i -e "/\s*#.*/s/\s*#.*//" -e "/^\s*$/d" $pkgfile
done

# Load files.
mapfile pkglist < "pkglist"
mapfile pkgkeys < "pkgkeys"

# Create package list with dependencies.
mapfile pkgdeps < <(echo ${pkglist[@]} | aur depends -n)
pkgdeps+=("${pkglist[@]}")

# Remove packages from repository.
cd "bin"
while read pkgpackage; do
  repo-remove "${pkgrepo}.db.tar.gz" $pkgpackage
done < <(comm -23 <(pacman -Slq $pkgrepo | sort) <(printf "%s" "${pkgdeps[@]}" | sort))
cd ".."

# Get package gpg keys.
for pkgkey in ${pkgkeys[@]}; do
  gpg --recv-keys --keyserver "hkp://ipv4.pool.sks-keyservers.net" $pkgkey
done

# Build outdated packages.
if (( ${#pkglist[@]} )); then
  aur sync -d $pkgrepo --root "${HOME}/bin" -n ${pkglist[@]}
fi

# Workaround fo GH releases because colon in names not permitted
if [[ ${DEPLOY_CUSTOM} != 1 ]]; then
  cd "bin"
  for package in *.tar.xz; do
    if [[ ${package} == *':'* ]]; then
      echo "renaming ${package} and add it back to db..."
      newname=${package/:/.}
      mv -- ${package} ${newname}
      repo-add "${pkgrepo}.db.tar.gz" ${newname}
    fi
  done
  cd ..
fi

{ set +ex; } 2>/dev/null
