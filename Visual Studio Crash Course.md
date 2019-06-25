
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

