# General Purpose Nix Config for macOS + NixOS

## Overview

Welcome to my nix configuration. 💻

Nix is a powerful package manager for Linux and Unix systems that ensures reproducible, declarative, and reliable software management.

This repository contains configuration for a general-purpose development environment that runs Nix on macOS, NixOS, or both simultaneously.

Check out the step-by-step commands below to get started!

## Disclaimer

The repository was built using the template from [dustinlyons/nixos-config](https://github.com/dustinlyons/nixos-config).

## Table of Contents

- [Nix Config for macOS + NixOS](#nix-config-for-macos--nixos)
  - [Overview](#overview)
  - [Table of Contents](#table-of-contents)
  - [Layout](#layout)
  - [Features](#features)
  - [Disclaimer](#disclaimer)
  - [Installing](#installing)
    - [For macOS (October 2024)](#for-macos-october-2024)
      - [1. Install dependencies](#1-install-dependencies)
      - [2. Install Nix](#2-install-nix)
      - [3. Pull nix-config](#3-pull-nix-config)
      - [4. Make apps executable](#4-make-apps-executable)
      - [5. Apply your current user info](#5-apply-your-current-user-info)
      - [6. Decide what packages to install](#6-decide-what-packages-to-install)
      - [7. Review your shell configuration](#7-review-your-shell-configuration)
      - [8. Install configuration](#8-install-configuration)
      - [9. Add dotfiles from outside of nix-config](#9-add-dotfiles-from-outside-of-nix-config)
      - [10. Make changes](#10-make-changes)
    - [For NixOS](#for-nixos)
      - [1. Burn and use the latest ISO](#1-burn-and-use-the-latest-iso)
      - [2. Install configuration](#2-install-configuration)
      - [3. Set user password](#3-set-user-password)
  - [How to Create Secrets](#how-to-create-secrets)
  - [Making Changes](#making-changes)
    - [Development workflow](#development-workflow)
    - [Trying packages](#trying-packages)
  - [Compatibility](#compatibility)
    - [Platforms](#platforms)
  - [Appendix](#appendix)
    - [Why Nix Flakes](#why-nix-flakes)
    - [NixOS Components](#nixos-components)
    - [License](#license)
    - [Support](#support)

## Layout

```
.
├── apps         # Nix commands used to bootstrap and build configuration
├── hosts        # Host-specific configuration
├── modules      # macOS and nix-darwin, NixOS, and shared configuration
├── overlays     # Drop an overlay file in this dir, and it runs. So far, mainly patches.
```

## Features

- **Nix Flakes**: No confusing `configuration.nix` entry point, [no Nix channels](#why-nix-flakes)─ just `flake.nix`
- **Same Environment Everywhere**: Easily share config across Linux and macOS (both Nix and Home Manager)
- **macOS Dream Setup**: Fully declarative macOS (Apple / Intel) w/ UI, dock and macOS App Store apps
- **Simple Bootstrap**: Simple Nix commands to start from zero, both x86 and macOS platforms
- **Managed Homebrew**: Zero maintenance homebrew environment with `nix-darwin` and `nix-homebrew`
- **Disk Management**: Declarative disk management with `disko`, say goodbye to disk utils
- **Secrets Management**: Declarative secrets with `agenix` for SSH, PGP, syncthing, and other tools
- **Super Fast Emacs**: Bleeding edge Emacs that fixes itself, thanks to a [community overlay](https://github.com/nix-community/emacs-overlay)
- **Built In Home Manager**: `home-manager` module for seamless configuration (no extra clunky CLI steps)
- **NixOS Environment**: Extensively configured NixOS including clean aesthetic + window animations
- **Nix Overlays**: [Auto-loading of Nix overlays](https://github.com/tjzegmott/nix-config/tree/main/overlays): drop a file in a dir and it runs _(great for patches!)_
- **Declarative Sync**: No-fuss Syncthing: managed keys, certs, and configuration across all platforms
- **Simplicity and Readability**: Optimized for simplicity and readability in all cases, not small files everywhere
- **Backed by Continuous Integration**: Flake auto updates weekly if changes don't break starter build

## Disclaimer

Installing Nix on macOS will create an entirely separate volume. It may exceed many gigabytes in size.

Some folks don't like this. If this is you, turn back now!

> [!NOTE]
> Don't worry, you can always [uninstall](https://github.com/DeterminateSystems/nix-installer#uninstalling) Nix later.

## Installing

## For macOS (October 2024)

This configuration supports both Intel and Apple Silicon Macs.

### 1. Install dependencies

``` sh
xcode-select --install
```

### 2. Install Nix

I use the nix multi-user [installation script](https://nixos.org/download/).

``` sh
sh <(curl -L https://nixos.org/nix/install)
```

After installation, open a new terminal session to make the `nix` executable available in your `$PATH`. You'll need this in the steps ahead.

> [!IMPORTANT]
>
> When using [the official installation instructions](https://nixos.org/download), [`flakes`](https://nixos.wiki/wiki/Flakes) and [`nix-command`](https://nixos.wiki/wiki/Nix_command) aren't available by default.
>
> You'll need to enable them.
>
> **Add this line to your `/etc/nix/nix.conf` file**
>
> ```
> experimental-features = nix-command flakes
> ```
>
> **_OR_**
>
> **Specify experimental features when using `nix run` below**
>
> ```
> nix --extra-experimental-features 'nix-command flakes' run .#<command>
> ```

### 3. Pull nix-config

> [!TIP]
> If you don't want to pull the repository you can replace the `.` with `github:tjzegmott/nix-config`. For example:
>
> ``` sh
> nix --extra-experimental-features 'nix-command flakes' run github:tjzegmott/nix-config#apply
> ```
>
> Which conveniently is the command for Step 5!

### 4. Make [apps](https://github.com/tjzegmott/nix-config/tree/main/apps) executable

``` sh
find apps/$(uname -m | sed 's/arm64/aarch64/')-darwin -type f \( -name apply -o -name build -o -name build-switch -o -name create-keys -o -name copy-keys -o -name check-keys \) -exec chmod +x {} \;
```

### 5. Apply your current user info

> [!NOTE]
> Not use that this step is required, check next time you set this up

Run this Nix command to replace stub values with your system properties, username, full name, and email.

> Your email is only used in the `git` configuration.

``` sh
nix run .#apply
```

> [!NOTE]
> If you're using a git repository, only files in the working tree will be copied to the [Nix Store](https://zero-to-nix.com/concepts/nix-store).
>
> You must run `git add .` first.

### 6. Decide what packages to install

You can search for packages on the [official NixOS website](https://search.nixos.org/packages).

**Review these files**

- [`modules/darwin/casks.nix`](https://github.com/tjzegmott/nix-config/blob/main/modules/darwin/casks.nix)
- [`modules/darwin/formulae.nix`](https://github.com/tjzegmott/nix-config/blob/main/modules/darwin/formulae.nix)
- [`modules/darwin/packages.nix`](https://github.com/tjzegmott/nix-config/blob/main/modules/darwin/packages.nix)
- [`modules/shared/packages.nix`](https://github.com/tjzegmott/nix-config/blob/main/modules/shared/packages.nix)

### 7. Review your shell configuration

Add anything from your existing `~/.zshrc`, or just review the new configuration.

**Review these files**

- [`modules/darwin/home-manager`](https://github.com/tjzegmott/nix-config/blob/main/modules/darwin/home-manager.nix)
- [`modules/shared/home-manager`](https://github.com/tjzegmott/nix-config/blob/main/modules/shared/home-manager.nix)

### 8. Install configuration

Ensure the build works before deploying the configuration, run:

``` sh
nix run .#build
```

> [!NOTE]
> If you're using a git repository, only files in the working tree will be copied to the [Nix Store](https://zero-to-nix.com/concepts/nix-store).
>
> You must run `git add .` first.

> [!WARNING]
> You may encounter `error: Unexpected files in /etc, aborting activation` if `nix-darwin` detects it will overwrite
> an existing `/etc/` file. The error will list the files like this:
>
> ```
> The following files have unrecognized content and would be overwritten:
>
>   /etc/nix/nix.conf
>   /etc/bashrc
>
> Please check there is nothing critical in these files, rename them by adding .before-nix-darwin to the end, and then try again.
> ```
>
> Backup and move the files out of the way and/or edit your Nix configuration before continuing.

### 9. Add dotfiles from outside of nix-config

1. Log in to 1password.
2. Apply `chezmoi`.

> [!NOTE] `chezmoi` with a single command
> You can install your dotfiles on new machine with a single command:
>
> ``` sh
> chezmoi init --apply https://github.com/$GITHUB_USERNAME/dotfiles.git
> ```
>
> If you use GitHub and your dotfiles repo is called dotfiles then this can be shortened to:
>
> ``` sh
> chezmoi init --apply $GITHUB_USERNAME
> ```

### 10. Make changes

Finally, alter your system with this command:

``` sh
nix run .#build-switch
```

> [!CAUTION] > `~/.zshrc` will be replaced with the [`zsh` configuration](https://github.com/tjzegmott/nix-config/blob/main/templates/starter/modules/shared/home-manager.nix#L8) from this repository. Make sure this is what you want.

## For NixOS

> [!IMPORTANT]
> I haven't done a NixOS set up yet using this configuration.

This configuration supports both `x86_64` and `aarch64` platforms.

### 1. Burn and use the latest ISO

Download and burn [the minimal ISO image](https://nixos.org/download.html) to a USB, or create a new VM with the ISO as base. Boot the installer.

> If you're building a VM on an Apple Silicon Mac, choose [64-bit ARM](https://channels.nixos.org/nixos-23.05/latest-nixos-minimal-aarch64-linux.iso).

**Quick Links**

- [64-bit Intel/AMD](https://channels.nixos.org/nixos-23.05/latest-nixos-minimal-x86_64-linux.iso)
- [64-bit ARM](https://channels.nixos.org/nixos-23.05/latest-nixos-minimal-aarch64-linux.iso)

### 2. Install configuration

#### Pick your template

> [!IMPORTANT]
> For Nvidia cards, select the second option, `nomodeset`, when booting the installer, or you will see a blank screen.

> [!CAUTION]
> Running this will reformat your drive to the `ext4` filesystem.

**Simple**

- Great for beginners, enables you to get started quickly and test out Nix.
- Forgoing secrets means you must configure apps that depend on keys or passwords yourself.
- You can always add secrets later.

``` sh
sudo nix run --extra-experimental-features 'nix-command flakes' github:tjzegmott/nix-config#install
```

**With secrets**

- Choose this to add more moving parts for a 100% declarative configuration.
- This template offers you a place to keep passwords, private keys, etc. _as part of your configuration_.

``` sh
sudo nix run --extra-experimental-features 'nix-command flakes' github:tjzegmott/nix-config#install-with-secrets
```

### 3. Set user password

On first boot at the login screen:

- Use shortcut `Ctrl-Alt-F2` (or `Fn-Ctrl-Option-F2` if on a Mac) to move to a terminal session
- Login as `root` using the password created during installation
- Set the user password with `passwd <user>`
- Go back to the login screen: `Ctrl-Alt-F7`

## How to create secrets

To create a new secret `secret.age`, first [create a `secrets.nix` file](https://github.com/ryantm/agenix#tutorial) at the root of your [`nix-secrets`](https://github.com/dustinlyons/nix-secrets-example) repository. Use this code:

> [!NOTE] > `secrets.nix` is interpreted by the imperative `agenix` commands to pick the "right" keys for your secrets.
>
> Think of this file as the config file for `agenix`. It's not part of your system configuration.

**secrets.nix**

``` nix
let
  user1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0idNvgGiucWgup/mP78zyC23uFjYq0evcWdjGQUaBH";
  users = [ user1 ];

  system1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPJDyIr/FSz1cJdcoW69R+NrWzwGK/+3gJpqD1t8L2zE";
  systems = [ system1 ];
in
{
  "secret.age".publicKeys = [ user1 system1 ];
}
```

Values for `user1` should be your public key, or if you prefer to have keys attached to hosts, use the `system1` declaration.

Now that we've configured `agenix` with our `secrets.nix`, it's time to create our first secret.

Run the command below.

```
EDITOR=vim nix run github:ryantm/agenix -- -e secret.age
```

This opens an editor to accept, encrypt, and write your secret to disk.

The command will look up the public key for `secret.age`, defined in your `secrets.nix`, and check for its private key in `~/.ssh/.`

> To override the SSH path, provide the `-i` flag with a path to your `id_ed25519` key.

Write your secret in the editor, save, and commit the file to your [`nix-secrets`](https://github.com/dustinlyons/nix-secrets-example) repo.

Now we have two files: `secrets.nix` and our `secret.age`.

Here's a more step-by-step example:

## Secrets Example

Let's say I wanted to create a new secret to hold my Github SSH key.

I would `cd` into my [`nix-secrets`](https://github.com/dustinlyons/nix-secrets-example) repo directory, verify the `agenix` configuration (named `secrets.nix`) exists, then run

```
EDITOR=vim nix run github:ryantm/agenix -- -e github-ssh-key.age
```

This would start a `vim` session.

I would enter insert mode `:i`, copy+paste the key, hit Esc and then type `:w` to save it, resulting in the creation of a new file, `github-ssh-key.age`.

Then, I would edit `secrets.nix` to include a line specifying the public key to use for my new secret. I specify a user key, but I could just as easily specify a host key.

**secrets.nix**

``` nix
let
  dustin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0idNvgGiucWgup/mP78zyC23uFjYq0evcWdjGQUaBH";
  users = [ dustin ];
  systems = [ ];
in
{
  "github-ssh-key.age".publicKeys = [ dustin ];
}
```

Finally, I'd commit all changes to the [`nix-secrets`](https://github.com/dustinlyons/nix-secrets-example) repository, go back to my `nixos-config` and run `nix flake update` to update the lock file.

The secret is now ready to use. Here's an [example](https://github.com/dustinlyons/nixos-config/blob/3b95252bc6facd7f61c6c68ceb1935481cb6b457/nixos/secrets.nix#L28) from my configuration. In the end, this creates a symlink to a decrypted file in the Nix Store that reflects my original file.

## Making changes

With Nix, changes to your system are made by

- editing your system configuration
- building the [system closure](https://zero-to-nix.com/concepts/closures)
- creating [a new generation](https://nixos.wiki/wiki/Terms_and_Definitions_in_Nix_Project#generation) based on this closure and switching to it

This is all wrapped up in the `build-switch` run command.

### Development workflow

So, in general, the workflow for managing your environment will look like

- make changes to the configuration
- run `nix run .#build-switch`
- watch Nix, `nix-darwin`, `home-manager`, etc do their thing
- go about your way and benefit from a declarative environment

### Trying packages

For quickly trying a package without installing it, I usually run

``` sh
nix shell nixpkgs#hello
```

where `hello` is the package name from [nixpkgs](https://search.nixos.org/packages).

## Compatibility

### Platforms

This configuration has been tested and confirmed to work on the following platforms:

- Newer M1/M2/M3 Apple Silicon Macs
- Older x86_64 (Intel) Macs
- Bare metal x86_64 PCs
- NixOS VMs inside VMWare on macOS
- macOS Sonoma VMs inside Parallels on macOS

## Appendix

### Why Nix Flakes

**Reasons to jump into flakes and skip `nix-env`, Nix channels, etc**

- Flakes work just like other package managers you already know: `npm`, `cargo`, `poetry`, `composer`, etc. Channels work more like traditional Linux distributions (like Ubuntu), which most devs don't know.
- Flakes encapsulate not just project dependencies, but Nix expressions, Nix apps, and other configurations in a single file. It's all there in a single file. This is nice.
- Channels lock all packages to one big global `nixpkgs` version. Flakes lock each individual package to a version, which is more precise and makes it much easier to manage overall.
- Flakes have a growing ecosystem (see [Flake Hub](https://flakehub.com/) or [Dev Env](https://devenv.sh/)), so you're future-proofing yourself.

### NixOS Components

| Component                | Description       |
| ------------------------ | :---------------- |
| **Window Manager**       | Xorg + bspwm      |
| **Terminal Emulator**    | alacritty         |
| **Bar**                  | polybar           |
| **Application Launcher** | rofi              |
| **Notification Daemon**  | dunst             |
| **Display Manager**      | lightdm           |
| **File Manager**         | thunar            |
| **Text Editor**          | emacs daemon mode |
| **Media Player**         | cider             |
| **Image Viewer**         | feh               |
| **Screenshot Software**  | flameshot         |

### License

This project is released under the [BSD-3-Clause license](https://github.com/tjzegmott/nix-config/blob/main/LICENSE).

### Support

Did you find my project useful? Please support the creator of the template used to make this config, `dustinlyons`.

<a href="https://www.buymeacoffee.com/dustinlyons1" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Them A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a> \* Should say "Buy Them a Coffee"
