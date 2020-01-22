# aur-av-bin

**aur-av-bin** is driven by [aurci](https://github.com/localnet/aurci), which uses [Travis CI](https://travis-ci.com/mxmilkb/aur-av-bin) to build binary [Arch Linux](https://www.archlinux.org/) packages from [AUR](https://aur.archlinux.org/) entries and deploy them to [GitHub Releases](https://github.com/mxmilkb/aur-av-bin/releases) which can be used through pacman by adding a repository in pacman.conf.

## How to use the repository on your machine

To use the aur-av-bin project as custom repository in your Arch Linux or Arch-desived distro install, add the following to the end of the /etc/pacman.conf file:

```
[aur-av-bin]
SigLevel = Optional TrustAll
Server = https://github.com/mxmilkb/aur-av-bin/releases/download/repository
```

Then on the command line:

```
pacman -Sy            # Refresh package database.
pacman -Sl aur-av-bin # Show packages in repository.
pacman -S {package}   # Install a package.
```

NOTE: The [list](https://github.com/mxmilkb/aur-av-bin/blob/aur-av-bin/pkglist) of currently maintained packages could change at any moment, though probably won't.
