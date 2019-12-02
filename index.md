---
title: "AURCI"
---

Use [Travis CI] for building and packaging a few [AUR] packages and deploy them
to [GitHub Releases] so it can be used as repository in [Arch Linux].

[![Build Status]](https://travis-ci.com/{{ site.github.owner_name }}/{{ site.github.project_title }})

## Use repository

To use as custom repository in [Arch Linux], add to file `/etc/pacman.conf`:

```bash
[{{ site.github.project_title }}]
SigLevel = Optional TrustAll
Server = {{ site.github.owner_url }}/{{ site.github.project_title }}/releases/download/repository
```

Then on the command line:

```bash
# Refresh package database
pacman -Syu

# Show packages in repository
pacman -Sl {{ site.github.project_title }}

# Install a package
pacman -S <package_name>
```

## Upstream contributions

If you want to contribute back some new feature you need:

- Switch to `master` from your personal repository: `git checkout master && git pull`
- Create a new feature branch: `git checkout -b my-feature`
- Add and commit your changes
- Push on your remote branch and go to the suggested GitHub page to create a
  new pull request.

[Arch Linux]:       https://www.archlinux.org
[AUR]:              https://aur.archlinux.org
[Build Status]:     https://travis-ci.com/{{ site.github.owner_name }}/{{ site.github.project_title }}.svg?branch=master
[Travis CI]:        https://travis-ci.com/{{ site.github.owner_name }}/{{ site.github.project_title }}
[GitHub Releases]: {{ site.github.owner_url }}/{{ site.github.project_title }}/releases
