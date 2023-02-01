default: img

ipl.bin: ipl.nas
	nasm -f bin ipl.nas -o ipl.bin -l ipl.lst

helloos.img: ipl.bin
	dd if=/dev/zero of=helloos.img bs=1024B count=1440
	yes "\xf0\xff\xff\x00\x00\x00\x00\x00" | dd of=helloos.img bs=8B count=1 oseek=64 conv=notrunc
	yes "\xf0\xff\xff\x00\x00\x00\x00\x00" | dd of=helloos.img bs=8b count=1 oseek=640 conv=notrunc
	dd if=ipl.bin of=helloos.img bs=512b count=1 conv=notrunc

img: helloos.img

run: img
	qemu-system-i386 -drive format=raw,if=floppy,index=0,readonly=true,file=helloos.img -boot order=a

clean:
	rm -f ipl.bin ipl.lst *.img
