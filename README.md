<div align="center">

# NekkoDroid's personal system image

*Welcome to the repository of my personal system image using [mkosi](https://github.com/systemd/mkosi).*\
*This image tries to stick to the default configurations of packages as much as possible.*
</div>

## Build steps

### Prerequisites

- [mkosi](https://github.com/systemd/mkosi) v23 or newer
- [pacman](https://repology.org/project/pacman-package-manager/versions) package manager

### Build a tools tree (optional)

> [!IMPORTANT]
> To build with local tools only please check the mkosi documentation for the needed packages.

Running the following command will build a tree with all necessary packages into `/mkosi.tools/`.
This will be picked up automatically by any following builds using `mkosi`, so no other local tools are necessary.

```shell
$ mkosi --image=mkosi-tools
```

### Build extra packages (optional)

> [!IMPORTANT]
> Skip this step if you have no custom packages to include in the final images.

If you have any extra PKGBUILDs you want to build, place them into `/mkois.image/mkosi-packages/`.
This will build all of them in lexographical ordering into `/mkosi.packages/` to use in following builds.


```shell
$ mkosi --image=mkosi-packages
```

> [!TIP]
> If you have any other pre-built packages to include, place them directly into `/mkosi.packages/`.

### Build the image

Running the following command will build the images into `/mkosi.output/`.

```shell
$ mkosi
```
