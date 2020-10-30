# aur-thalhalla-bin

**aur-thalhalla-bin** is driven by [aurci](https://github.com/localnet/aurci), which uses [Travis CI](https://travis-ci.com/Thalhalla/aur-thalhalla-bin) to build binary [Arch Linux](https://www.archlinux.org/) packages from [AUR](https://aur.archlinux.org/) entries and deploy them to [GitHub Releases](https://github.com/Thalhalla/aur-thalhalla-bin/releases) which can be used through pacman by adding a repository in pacman.conf.

## How to use the repository on your machine

To use the aur-thalhalla-bin project as custom repository in your Arch Linux or Arch-desived distro install, add the following to the end of the /etc/pacman.conf file:

```
[aur-thalhalla-bin]
SigLevel = Optional TrustAll
Server = https://github.com/Thalhalla/aur-thalhalla-bin/releases/download/repository
```

Then on the command line:

```
pacman -Sy            # Refresh package database.
pacman -Sl aur-thalhalla-bin # Show packages in repository.
pacman -S {package}   # Install a package.
```

NOTE: The [list](https://github.com/Thalhalla/aur-thalhalla-bin/blob/aur-thalhalla-bin/pkglist) of currently maintained packages could change at any moment, though probably won't.
