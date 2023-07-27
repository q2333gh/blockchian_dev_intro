# WebAssembly intro:

content from: https://youtu.be/3sU557ZKjUs  
WASM:
1.assembly language for web browser  
![Alt text](image.png)  
2.A solution to a problem:
problem is JS:
JS running on browser steps:
![Alt text](image-1.png)  
带来的问题就是运行速度太慢,总是需要现场编译 js 文件  

wasm 是一个运行在 browser 里面的 VM  
这个 VM 运行 bytecode(vm-assembly)  

利用这个特性,可以编译任何语言为 assembly!  

原生的 asm 代码是 architecture-specific  
因此 computer scientist 发明了 virtual-processor  
分离了原生 asm 和 phsical-processor  
最终使得 v-asm 可以运行于任何的 cpu 上面!  
![Alt text](image-2.png)  
![Alt text](image-4.png)  
这里是一个.wasm 文件,包含了一堆可以拿来用的函数  
有点像.dll 文件  
![Alt text](image-3.png)  
![Alt text](image-5.png)  

.wat 文件是对应像.S (汇编代码) 文件,有助记符,text format of WebAssembly  
.wasm 则是纯二进制直接可以运行在 VM 上面的文件,可以用 hexdump 来简单查看.  
使用 wat2wasm 则转译,作用像是 as 汇编器  
使用 wasmtime 可以在命令行运行 wasm 文件,像是 js 的 runtime:如 nodejs  
WASI:WebAssembly System Interface, 提供系统级别的 IO  

#### 编译过程:

c++/rust 高级语言代码 -> .wat 汇编文件 -> wasm 二进制文件  
对比理解:
![Alt text](image-6.png)  
