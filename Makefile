default: img

helloos.img: helloos.nas Makefile
	nasm -f bin helloos.nas -o helloos.img -l helloos.lst

img: helloos.img

run: img
	qemu-system-i386 -drive format=raw,if=floppy,index=0,readonly=true,file=helloos.img -boot order=a

clean:
	rm helloos.img helloos.lst
