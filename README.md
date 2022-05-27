# Scripted installation of IDrive scripts for Linux

This script ([install-idrive](install-idrive)), installs
[IDrive scripts for Linux](https://www.idrive.com/online-backup-linux) to a
Debian or Ubuntu computer.

You will most likely run this inside some kind of container.

It also sets up an empty directory `/sync-to-offsite` inside the container where
you run it. You may want to mount a directory/volume there in readonly mode, and
have configure IDrive to back it up.

## Install

Put the [install-idrive](install-idrive) script in the container where you want
to run it, and set executable permissions.

For example:

```sh
wget https://raw.githubusercontent.com/hugojosefson/idrive.com/main/install-idrive

# inspect the script, so you know what to expect!
cat install-idrive

# set executable permissions
chmod +x install-idrive
```

## Usage

The script expects you to run it as `root`.

```
./install-idrive
```

Then follow the instruction given on how to proceed.

## Quick testing

Using Docker, you can test the script's syntax and that it works as expected.

When you build the Docker container, it runs the script as part of the build.

```sh
# on your computer
docker build -t my-idrive-install-image .
```

Run the container:

```sh
# on your computer
docker run --rm -it my-idrive-install-image
```

Once you are inside the container, follow the instruction given from the
`install-idrive` script during `docker build`:

```sh
# inside the container
account_setting.pl --auto-setup
```

---

_I am not affiliated with IDrive Inc._
