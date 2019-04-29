
### Edit Faster

> **Select all instances of a pattern**
- `Alt + F3`

> **Write at multiple location simultaneously**
- Put curson on word.
- Press Ctrl + d as many time as many instance you want to edit or insert.
- Write the whatever you like at multiple location simultaneously.

> **Edit multiple line simultaneously**
- Press Ctrl + Alt + <UP/DOWN ARROW> to select line.
- Write the whatever you like at multiple location simultaneously.

> **Edit multiple line at the end simultaneously**
- Select the all lines you want to edit by `Shift + <UP/DOWN ARROW>` or mouse.
- Press `Ctrl + Shift + L` & got to end of line by `End` key.
- Write the whatever you like at multiple location simultaneously.

> **Move line up/down**
- `Ctrl + Shift + <UP/DOWN ARROW>`

> **Copy Paste Line**
- `Ctrl + Shift + d`

> **Delete Line**
- `Ctrl + Shift + k`

> **Move Curson To Left/Right Of Word**
- `Ctrl + <Left/Right Arrow>`

> **Comment code faster**
- `Ctrl + /` - Single line comment
- `Ctrl + Shift + /` - Multi line comment
Note: Make sure that you selected syntax type, before commenting 

> **Delete whole line**
- `Shift + Delete`

> **Sort Lines Alphabetically**
- `F9`

### Traversing the Code

> **Traversing all funtion in file**
- `Ctrl+R`

> **Jump To Matching Bracket Addition**
- `Ctrl+M`

> **Goto end/beginning of file**
- end/beginning = `Ctrl+End`/`Ctrl+Home`

> **Goto definition & back**
- Goto definition `F12` & goto back `Alt + -`.

> **Opening New File**
- `Ctrl + p` & type file name.

> **Switching between opened files**
- Forward/Backward `Ctrl + <PageUp/PageDown>`.

> **Closing file**
- `Ctrl + w`

> **Going to particular function,line or variable of file**
- `Ctrl + p` & type <file name> `@` [function name].
- `Ctrl + p` & type <file name> `#` [variable name].
- `Ctrl + p` & type <file name> `:` [line no].

> **Traverse all instance of symbol in file**
- Put curson on it, Press `Ctrl + f` & Press `Enter`.

> **Toggle Project Browser**
- `Ctrl + k + b`

> **Opening multiple layout**
- `Alt + Shift + 2` for 2 column.
- `Alt + Shift + 3` for 3 column.
- `Alt + Shift + 8` for 2 row.

> **Switching/Toggle between layouts**
- `Ctrl + 0` for project browser.
- `Ctrl + 1` for layout file 1.
- `Ctrl + 2` for layout file 2.

> **Find project wide or find in all files**
- `Ctrl + Shift + f`.
- Exclude folder from search type `-*/folder_name/*` in where box.
- Exclude files from search type `-*.cmm, -*.log, -*.bat` in where box.

> **Jump to line**
- `Ctrl + g` & type line no.

### Plugin/Packages
- C++Snippet : [Shortcut Helpers](https://github.com/Rapptz/cpp-sublime-snippet/blob/master/reference.md).
- [Tabularize](https://github.com/VisheshPatel/DeveloperUseful/blob/master/Sublime%20Text%20Plugin%20:%20Tabularize.md).
- [Serial Number](https://github.com/VisheshPatel/DeveloperUseful/blob/master/Sublime%20Text%20Plugin%20:%20Serial%20Number.md).
- [Sublimerge 3](https://www.sublimerge.com/sm3/)
- All Autocomplete
- [C++ auto completion:Turn on popup/autocomplete feature in Sublime Text 3](https://www.youtube.com/watch?v=dUPZ9fqd7K4)
### Theme
- Dracula

### Misc

> **Custome Settings**
- `Ctrl + Shift + p`, type & open `Preferences Settings`. Add following lines.
```
{
	"bold_folder_labels": true,
	"color_scheme": "Packages/Dracula Color Scheme/Dracula.tmTheme",
	"fade_fold_buttons": false,
	"font_size": 12,
	"highlight_line": true,
	"ignored_packages":
	[
		"Vintage"
	],
	"show_full_path": true,
	"trim_trailing_white_space_on_save":true
}
```
> **Exclude folder/files in project browser**
- Open `.sublime-project`, Need to save project first to generate `.sublime-project`.
- Edit following
```
{
	"folders": [{
		"path": ".",
		"folder_exclude_patterns": [".svn", "._d", ".metadata", ".settings", "2.0", "*.vc*"],
		"file_exclude_patterns": ["*.pyc", "*.pyo", ".project", "*.checksum"],
		"enable_count_lines":true,
		"enable_count_chars":true,
		"enable_line_char_count":true,
		"enable_line_word_count":true,
	}]
}
```
> **Prefered color scheme**
- Monokai
- Pastels on Dark

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
- `Ctrl + Shift + p`, type `disable`

> **To see sublime command or CLI**
- `Ctrl + ~` & enter `sublime.log_commands(True)`


### C++ Build System

1. Install compiler if you don’t have it. I would suggest use MinGW compiler for Windows because Windows doesn’t have a GNU compiler for C++ language.

2. After installing, set the path variable to the location where you have installed the compiler.

3. Now Open Sublime Text Editor. Go into Tools > Build System> New Build System.

4. Copy this code into the file.
```
{
	"shell_cmd": "g++ \"${file}\" -o \"${file_path}\\\\${file_base_name}\"", "file_regex": "^(..[^:]):([0-9]+):?([0-9]+)?:? (.)$",
	"working_dir": "${file_path}",
	"selector": "source.c, source.c++",

	"variants":
	[
		{
			"name": "Run",
			"shell_cmd": "g++ -O2 -std=c++11 \"${file}\" -o \"${file_path}\\\\${file_base_name}\" && \"${file_path}\\\\${file_base_name}\" > input.txt 2>&1"
		}
	]
}
```
5. Save it. Rename the file as “MyC++Build” or anything you want and save it.

6. Go into Tools > Build System and then Select your Build “MyC++Build”.

7. Later open any folder using Ctrl+O where you usually store your programs. In that folder create a file name “input.txt”.

8. Now start coding. Write a program and then save it in that folder only. The benefit of doing is that whenever you have to give inputs just open the created input.txt enter your input data and save it. Later perform Ctrl+B for compiling and Ctrl+Shift+B for Run.

9. For better usage just open your Sublime with 2 column view.
