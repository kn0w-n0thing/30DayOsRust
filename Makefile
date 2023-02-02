TOOLPATH = ../z_tools/
NASK     = nasm
EDIMG    = $(TOOLPATH)edimg.exe
IMGTOL   = $(TOOLPATH)imgtol.com
DEL      = rm
OUTPUTIMG= heribote.img

default: img

ipl10.bin: ipl10.nas
	$(NASK) -f bin ipl10.nas -o ipl10.bin -l ipl10.lst

haribote.sys : haribote.nas Makefile
	$(NASK) -f bin haribote.nas -o haribote.sys -l haribote.lst

haribote.img: ipl10.bin haribote.sys
	dd if=/dev/zero of=$(OUTPUTIMG) bs=1024 count=1440
	echo "\xf0\xff\xff\x00\x00\x00\x00\x00" | dd of=$(OUTPUTIMG) bs=8 count=1 oseek=64 conv=notrunc
	echo "\xf0\xff\xff\x00\x00\x00\x00\x00" | dd of=$(OUTPUTIMG) bs=8 count=1 oseek=640 conv=notrunc
	dd if=ipl10.bin of=$(OUTPUTIMG) bs=512 count=1 conv=notrunc
	echo "HARIBOTESYS" | dd of=$(OUTPUTIMG) bs=512 count=1 oseek=19 conv=notrunc
	dd if=haribote.sys of=$(OUTPUTIMG) bs=512 count=1 oseek=33 conv=notrunc

img: haribote.img

run: img
	qemu-system-i386 -drive format=raw,if=floppy,index=0,readonly=true,file=$(OUTPUTIMG) -boot order=a

clean :
	-$(DEL) ipl10.bin
	-$(DEL) ipl10.lst
	-$(DEL) haribote.sys
	-$(DEL) haribote.lst
	-$(DEL) $(OUTPUTIMG)
