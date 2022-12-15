#!/bin/bash

# assemble helloos.nas to a raw image
nasm -f bin helloos.nas -o helloos.img

# boot an x86 32bit virtual machine with a raw image
qemu-system-i386 -drive format=raw,if=floppy,index=0,readonly=true,file=helloos.img -boot order=a
