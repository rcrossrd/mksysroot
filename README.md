# mksysroot

Script for creating RaspberryPi ross compile sysroot on macOS

The idea for this script is based on the post by (Harld 
Fernengel)[https://medium.com/@haraldfernengel/cross-compiling-c-c-from-macos-to-raspberry-pi-in-2-easy-steps-23f391a8c63]


## Prerequisites

This script is intended to be used on macOS and has the same dependencies
as mentioned by Harald:

```
brew install arm-linux-gnueabi-binutils
brew install llvm
brew install rsync
```

You will also need a live RaspberryPi system and an SSH connection to it.

## Usage

The script code `mksysroot` is reasonably well documented, but in short,
it does the following:

1. Sets up local directory for sysroot.
2. Copies sysroot files from RaspberryPi.
3. Adjusts the makefile `RPi.mk`.

To use simply point to your Raspberry SSH and specify local name for sysroot
directory. For example:

`~/github/mksysroot/mksysroot pi@mypi: RPi1A`

That will create a sysroot directory `RPi1A`. It that directory you will find
`RPi.mk` file and `test` directory. The `test` directory contains very simlpe
tests for compiling C and C++ apps to make sure your setup works.

To compile test apps:

`make -C RPi1A/test all`

Then just copy `RPi1A/test/test` and `RPi1A/test/testpp` to your RaspberryPi
and run there.
