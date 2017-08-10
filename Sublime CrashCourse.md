
### Edit Faster

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

### Traversing the Code

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

> **Jump to line**
- `Ctrl + g` & type line no.

### Plugin
- C++Snippet : [Shortcut Helpers](https://github.com/Rapptz/cpp-sublime-snippet/blob/master/reference.md).

### Misc

> **Custome Settings**
- `Ctrl + Shift + p`, type & open `Preferences Settings`. Add following lines.
```
	"highlight_line": true,
	"bold_folder_labels": true,
 	"fade_fold_buttons": false,
	"show_full_path": true,
```
> **Exclude folder/files in project browser**
- Open `.sublime-project`, Need to save project first to generate `.sublime-project`.
- Edit following
```
{
	"folders": [{
		"path": ".",
		"folder_exclude_patterns": [".svn", "._d", ".metadata", ".settings", "1.0", "2.0"],
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

> **Key Binding**
- `Ctrl + Shift + p`, type & open `Key Bindings`. Add following lines.
```
[
	{ "keys": ["f10"], "command": "reindent", "args": {"single_line": false} },			//F10 for reindentation
	{ "keys": ["ctrl+up"], "command": "select_lines", "args": {"forward": false} },		//Multiple curson up
	{ "keys": ["ctrl+down"], "command": "select_lines", "args": {"forward": true} },	//Multiple curson down
	{ "keys": ["ctrl+right"], "command": "goto_definition"},								//Jump to function definition
	{ "keys": ["ctrl+left"], "command": "jump_back"},										//Jump back
	{ "keys": ["f5"], "command": "refresh_folder_list"},								//Refresh project
]
```


> **To see sublime command or CLI**
- `Ctrl + ~` & enter `sublime.log_commands(True)`

