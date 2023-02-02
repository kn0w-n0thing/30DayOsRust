# 30DayOsRust
灵感来自于《30天自制操作系统》，作者川合秀实，ISBN 978-7-115-28796-0。

将书中的内容通过Rust再次实现一遍。
# 安装 Qemu
```shell
brew install qemu
```

# 执行
```shell
./run.sh
```

# 记录
## 2022-12-16
1. 通过nasm生成二进制镜像，并通过qemu启动
2. 作者自己实现的nask汇编器会自动将`RES`伪指令分配的空间赋值为0，但是nasm汇编器并不会这么做。需要通过`time xx DB 0x00`来实现

## 2022-12-18
1. 随书光盘中的nas文件编码为shift JIS
2. nasm中支持`$`和`$$`运算符，但是`times`不支持`constant - $`参数，必须使用`times number-($-$$)`。[（参考连接）](https://stackoverflow.com/questions/46726434/what-does-double-dollar-sign-mean-in-x86-assembly-nasm)

## 2023-01-03
1. 通过`nasm`命令`-l`选项生成listing文件

## 2023-01-11
1. 通过`dd`命令创建、修改软驱镜像文件。[(参考链接)](https://linuxopsys.com/topics/linux-dd-command-with-examples)

## 2023-02-02
1. 作者自己编写的二进制工具源码在光盘文件的`/omake/tolsrc`下
2. 以上内容可以,总结为:一般向一个空软盘保存文件时， 
(l)文件名会写在:0x002600以后的地方；
(2)文件的内容会写在0x004200以后的地方。
3. 因为目前无法理解Rust的编译、链接的原理，进度停留在P60