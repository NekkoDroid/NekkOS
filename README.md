<div align="center">

# NekkOS &mdash; System Image

*Welcome to the repository of my personal dream system image built using [mkosi](https://github.com/systemd/mkosi).*
</div>

## :thought_balloon: The Vision

This entire project started out as an attempt to implement [Fitting Everything Together](https://0pointer.net/blog/fitting-everything-together.html).
So it would be beneficial to first read that, as the following will mostly build on top of that with certain deviations.

### Partition layout

#### `EFI` System Partition

- Format: VFAT
- Size: 0.5G

This is the partition intended to hold the `systemd-boot` bootloader, its configuration and some small EFI binaries that
should be listed in the bootloader interface. When dual-booting with Windows this also houses its bootloader files.

#### `XBOOTLDR` Partition

- Format: VFAT
- Size: 2G

This is a separate partition to `EFI` partition because the `EFI` partition created by Windows is limited to 100M in
size by default and being able to dual-boot with Windows is one of the main intended use-cases. This partition holds a
UKI for each `usr` partition that one should be able to boot into.

#### `usr` Partition A & B

- Label: `NekkOS_<version>`
- Format: dm-verity (EROFS)
- Size: 5G

> [!NOTE]
> During partitioning the B partition gets the label of `_empty` to be populated on first update.

dm-verity based system partition that contains the minimal usable system to boot into.
Each update to the base system switches between populating the A and B version of the partitions.

#### `usr-verity` Partition A & B

- Label: `NekkOS_<version>`
- Format: dm-verity (HASH)
- Size: 0.5G

> [!NOTE]
> During partitioning the B partition gets the label of `_empty` to be populated on first update.

Contains dm-verity integrity hash data for the matching `usr` partition.

#### `swap` Partition

- Format: LUKS (swap)
- Size: 100% RAM

> [!NOTE]
> Encrypt partition contents using LUKS2, tied to TPM2 PCR 7 and 11 as well as with a backup password.

The minimum size should be at least enough to enable system hibernation.
This partition is used to aid in memory management, especially when the system is under memory related pressure.

#### `root` Partition

- Format: LUKS (BTRFS)
- Size: 0.5G

> [!NOTE]
> Encrypt partition contents using LUKS2, tied to TPM2 PCR 7 and 11 as well as with a backup password.

This partition is by default read-only and can be remounted as read-write when needed.
This partition only contains the root filesystem structure and a few basic configuration files that are populated during
installation by running `systemd-firstboot`. This is required because `machine-id` is used in the UUID calculation for
the `var` partition and therefor needs to be unique for each installation.

#### `var` Partition

- Format: LUKS (BTRFS)
- Size: remaining

> [!NOTE]
> Encrypt partition contents using LUKS2, tied to TPM2 PCR 7 and 11 as well as with a backup password.

This is the required mutable partition for system state. `/home/` bind mounts into a directory within this partition,
so that the 2 mutable locations do not need to be separate partitions, which would likely result in them needing to be
resized when one of them is nearing maximum capacity.

### Directory layout

For more detailed information on some of the directories please visit the following site:
https://www.freedesktop.org/software/systemd/man/latest/file-hierarchy.html

- `/`:  mount point for the `root` partition
- `/boot/`: mount point for the `XBOOTLDR` partition
- `/efi/`: mount point for the `ESP` partition
- `/srv/`: mount point for the `srv` partition
- `/tmp/`: mount point for a `tmpfs`
- `/home/`:  mount point for the `home` partition
- `/root/`: administrator home directory
- `/etc/`: administrator configuration files

#### Runtime Data

- `/run/`: runtime data, sockets and similar files
- `/run/log/`: runtime system logs
- `/run/user/`: per-user `$XDG_RUNTIME_DIR`

#### Vendor-supplied Operating System Resources

- `/usr/`: mount point for the `usr` partition
- `/usr/bin/`: system executable files
- `/usr/lib/`: system library files
- `/usr/libexec/`: package executable files
- `/usr/share/`: package resource files
- `/usr/etc/`: package configuration files

#### Persistent Variable System Data

- `/var/`: mount point for `var` partition
- `/var/tmp/`: mount point for `tmp` partition
- `/var/cache/`: persistent system cache
- `/var/lib/`: persistent system data
- `/var/log/`: persistent system logs
- `/var/home/`: `systemd-homed` managed user accounts
- `/var/lock/`: system device and resource lock files
- `/var/spool/`: printer, mail and similar queues

#### Compatibility Symlinks

- `/bin/` -> `/usr/bin/`
- `/lib/` -> `/usr/lib/`
- `/var/run/` -> `/run/`

#### Home Directory

- `$XDG_CACHE_HOME` (default: `~/.cache/`) : persistent user cache
- `$XDG_CONFIG_HOME` (default: `~/.config/`): user configuration files
- `$XDG_BIN_HOME` (default: `~/.local/bin/`): user executable files
- `$XDG_LIB_HOME` (default: `~/.local/lib/`): user library files
- `$XDG_DATA_HOME` (default: `~/.local/share/`): user shared resources
- `$XDG_STATE_HOME` (default: `~/.local/state/`): persistent user state

### Installation process

```sh
$ systemd-repart --dry-run=false --defer-partitions=var "$DRIVE"
$ systemd-firstboot --image="$DRIVE" --prompt --setup-machine-id
$ systemd-repart --image="$DRIVE" --dry-run=false
$ bootctl install --image="$DRIVE"
```
