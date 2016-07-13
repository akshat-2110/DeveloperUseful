> **Gcc Compiler Options**

[All Compiler Options -c, -o, -E, -Wall, --Werror & 15 more](http://www.thegeekstuff.com/2012/10/gcc-compiler-options/)

> **File Compatibility**

```awk 'sub("$", "\r")' unixFile.txt > windowsFile.txt```

```awk '{ sub("\r$", ""); print }' windowsFile.txt > unixFile.txt```

> **Process**

```ps -au | grep [USERNAME]```

> **Create Soft & Hard Links**

```ln -sf [target] [source]```

*Soft Links(-s Parameter)* : point to the file name

*Hard Links(By Default)*   : point to the file contents(share the same inode)

> **Symbol Table Information**

```nm -n [ELF_file]```
*Note:-n option sort symbols by address*

*Example*

[VirtualAddress]        [SymbolType]      [SymbolName]

0000000000601038        B                 __bss_start

SymbolType : Lower case = local & Upper case = external

> **List of Object include in static lib**

```ar -t [libname.a]```

> **List of shared Object used**

```ldd [libname.so]  OR ldd [Executable]```

> **File Transfer between PCs**

```scp [file_name] [user]@[IP]:[location]```

i.e.```scp image.jpg vishal@192.168.0.1:/home/vishal```

> **tar file(compress)**

```tar -cvf [file_name].tar [file_name]```

> **Untar file(de-compress)**

```tar -xvf [file_name].tar```
