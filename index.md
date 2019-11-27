---
title: "AURCI"
---

[![Build Status]](https://travis-ci.com/{{ site.github.owner_name }}/{{ site.github.project_title }})

Use [Travis CI] for building and packaging a few [AUR] packages and deploy them
to [GitHub Releases] so it can be used as repository in [Arch Linux].

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
pacman -S {package}
```

**NOTE:** List of currently maintained packages can change at any moment.

## Forking repository

For build the [AUR] packages of your election fork this repository and enable
[Travis CI GitHub App]:

```
- Fork this GitHub repository and edit `pkglist`.
- Generate a personal access token with scope `public_repo`.
- Enable Travis CI for your new forked repository.
- In Travis CI repository settings disable build pull request updates, for security.
- In Travis CI repository settings declare one environment variable:
- `GITHUB_TOKEN`: The previously created personal access token, disable display value.
- Optionally, enable a cron job in Travis CI repository settings.
```

[Arch Linux]:      https://www.archlinux.org
[AUR]:             https://aur.archlinux.org
[Build Status]:    https://travis-ci.com/{{ site.github.owner_name }}/{{ site.github.project_title }}.svg?branch=master
[GitHub Releases]: {{ site.github.owner_url }}/{{ site.github.project_title }}/releases
[Travis CI]:       https://travis-ci.com/{{ site.github.owner_name }}/{{ site.github.project_title }}
[Travis CI GitHub App]: https://travis-ci.com
