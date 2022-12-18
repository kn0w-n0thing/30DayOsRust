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
2. nasm中支持`$`和`$$`运算符，但是`times`不支持`constant - $`参数，必须使用`times number-($-$$)`。[参考连接](https://stackoverflow.com/questions/46726434/what-does-double-dollar-sign-mean-in-x86-assembly-nasm)