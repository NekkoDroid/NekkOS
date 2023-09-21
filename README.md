# NekkoDroids personal Arch Linux installation script

*Just my personal installation script for when I am reinstalling [Arch Linux](https://archlinux.org).*\
*This script is mostly configuration agnostic, but has some parts that are slightly geared to me.*

## What does this install?

This is a minimal installation script to with my DE of choice.

### What you get:

- Secure boot
- Systemd boot loader
- Plymouth boot screen
- 2 signed unified kernel images based on the release kernel
  - 1 system kernel which is used for general usage
  - 1 rescue kernel with sending you to the `rescue.target`
- Drivers for Intel, AMD and NVIDIA
- GDM and GNOME using Wayland
- Minimal apps
  - File manager
  - Software Center
  - System Settings

## How to use this?

1. Acquire an Arch Linux installation image
2. Copy this directory somewhere to the image
3. Change your "Secure Boot" settings to "Setup Mode" in your UEFI
4. Boot into the installation image
5. (Optional) Change your keyboard layout
6. Mount your installation medium
7. Run `setup.sh`

> !!! NOTE !!! During the execution of the script you will need to manually enter information

## Configuration options

### Environment Variables

- `FORMAT` (Optional): Set this to any drive you want to format and use as your system drive
  - This will divide it up as follows: 4GB boot partition, 16GB swap partition, rest root partition

### Partition layout

If you don't want the script to automatically format your partition and you want to select the layout yourself
you can manually partition your drives before running the script. The script itself will not generate an `/etc/fstab`
file, instead the system will use Systemd to mount partitions automatically, that following the
[Discoverable Partitions Specification](https://uapi-group.org/specifications/specs/discoverable_partitions_specification).

> !!! NOTE !!! This script does not check that the labels match the UUIDs

#### Required

- A partition labeled `boot` with type UUID `c12a7328-f81f-11d2-ba4b-00a0c93ec93b` (mounted at `/boot`)
- A partition labeled `root` with type UUID `4f68bce3-e8cd-4db1-96e7-fbcaf984b709` (mounted at `/`)

#### Optional

- A partition labeled `swap` with type UUID `0657fd6d-a4ab-43c4-84e5-0933c84b4f4f` (enabled as swap)
- A partition labeled `home` with type UUID `933ac7e1-2eb4-4f13-b844-0e14e2aef915` (mounted at `/home`)
- A partition labeled `usr` with type UUID `8484680c-9521-48c6-9c11-b0720656f69e` (mounted at `/usr`)
- A partition labeled `srv` with type UUID `3b8f8425-20e0-4f3b-907f-1a25a76f98e8` (mounted at `/srv`)
- A partition labeled `var` with type UUID `4d21b016-b534-45c2-a9fb-5c16e091fd2d` (mounted at `/var`)
- A partition labeled `tmp` with type UUID `7ec6f557-3bc5-4aca-b293-16ef5df639d1` (mounted at `/var/tmp`)

### Other Locations

Modify the `config.d/01-locale.sh` file to enable the different locales that you need
- I do not know a way to make these interactively selectable, so for now you have enable them in the script
