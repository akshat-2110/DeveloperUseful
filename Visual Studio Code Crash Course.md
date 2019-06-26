
### Edit Faster

> **Select all instances of a pattern**
- ``

> **Write at multiple location simultaneously**
- 

> **Edit multiple line simultaneously**
- 

> **Edit multiple line at the end simultaneously**
- 

> **Move line up/down**

> **Copy Paste Line**

> **Delete Line**

> **Move Curson To Left/Right Of Word**

> **Comment code faster**

> **Delete whole line**

> **Sort Lines Alphabetically**

### Traversing the Code

> **Traversing all funtion in file**


> **Jump To Matching Bracket Addition**
- 
> **Goto end/beginning of file**

> **Goto definition & back**

> **Opening New File**

> **Switching between opened files**

> **Closing file**

> **Going to particular function,line or variable of file**

> **Traverse all instance of symbol in file**

> **Toggle Project Browser**

> **Opening multiple layout**

> **Switching/Toggle between layouts**

> **Find project wide or find in all files**

> **Jump to line**

### Plugin/Packages
- Microsoft C/C++ Extension
- 

### Theme

### Misc

> **Custome Settings**

> **Key Binding**
- `Ctrl + Shift + p`, type & open `Key Bindings`. Add following lines.
```
[
	{ "keys": ["f10"], "command": "reindent", "args": {"single_line": false} },			//F10 for reindentation
	{ "keys": ["ctrl+up"], "command": "select_lines", "args": {"forward": false} },		//Multiple curson up
	{ "keys": ["ctrl+down"], "command": "select_lines", "args": {"forward": true} },	//Multiple curson down
	{ "keys": ["ctrl+left"], "command": "jump_back"},										//Jump back
	{ "keys": ["ctrl+right"], "command": "goto_definition"},								//Jump to function definition	
	{ "keys": ["f5"], "command": "refresh_folder_list"},
	{ "keys": ["ctrl+7"], "command": "toggle_comment", "args": { "block": false } },
	{ "keys": ["ctrl+shift+7"], "command": "toggle_comment", "args": { "block": true } },

	{"keys": ["ctrl+shift+t"], "command": "tabularize"},
	{"keys": ["ctrl+v"], "command": "paste_and_indent"},
	{"keys": ["ctrl+shift+s"], "command": "serialnumber"}
]
```
> **How to disable package?**
- 
> **To see sublime command or CLI**

# Build Systems

> **C++ single file build setting**
- Prerequisites:
 1. `MinGW` installation in directory `C:/MinGW`
- `tasks.json` (COMPILING)
```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "C++ build trial.cpp",
            "type": "shell",
            "command": "C:\\MinGW\\bin\\g++.exe",
            "args": [
                "-g",
                "${file}",
                "-o",
                "${fileDirname}\\${fileBasenameNoExtension}.exe"
            ],
            "options": {
                "cwd": "C:\\MinGW\\bin"
            },
            "problemMatcher": [
                "$gcc"
            ]
        }
    ]
}
```
- `c_cpp_properties.json` (INTELLISENSE)
```json
{
    "configurations": [
        {
            "name": "Win32",
            "includePath": [
                "${workspaceFolder}/**",
                "C:/MinGW/lib/gcc/mingw32/6.3.0/include/c++",
                "C:/MinGW/lib/gcc/mingw32/6.3.0/include/c++/mingw32"
            ],
            "defines": [
                "_DEBUG",
                "UNICODE",
                "_UNICODE"
            ],
            "windowsSdkVersion": "10.0.16299.0",
            "compilerPath": "C:/MinGW/bin/g++.exe",
            "cStandard": "c11",
            "cppStandard": "c++17",
            "intelliSenseMode": "gcc-x64"
        }
    ],
    "version": 4
}
```
- `launch.jason` (DEBUGGING) 
```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "(gdb) Launch",
            "type": "cppdbg",
            "request": "launch",
            "program": "${workspaceFolder}/trial.exe",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": true,
            "MIMode": "gdb",
            "miDebuggerPath": "C:\\MinGW\\bin\\gdb.exe",
            "preLaunchTask": "C++ build trial.cpp",
            "setupCommands": [
                {
                    "description": "Enable pretty-printing for gdb",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        }
    ]
}
```
