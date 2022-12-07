#!/bin/bash

qemu-system-i386 -drive format=raw,if=floppy,index=0,readonly=true,file=helloos.img -boot order=a
