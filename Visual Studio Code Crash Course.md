### Edit Faster

> **Select all instances of a pattern**
- `Alt + F3`

> **Write at multiple location simultaneously**
- Put cursor on word.
- Press Ctrl + d as many time as many instance you want to edit or insert.
- Write the whatever you like at multiple location simultaneously.

**or**

- `Selecion` -> `Switch to Alt+Click for Multi-Cursor`
- `Ctrl+<left click>` & edit

> **Edit multiple line simultaneously**
- Press Ctrl + Alt + <UP/DOWN ARROW> to select line.
- Write the whatever you like at multiple location simultaneously.

> **Edit multiple line at the end simultaneously**
- Select the all lines you want to edit by `Shift + <UP/DOWN ARROW>` or mouse.
- Press `Ctrl + Shift + L` & got to end of line by `End` key.
- Write the whatever you like at multiple location simultaneously.

> **Move line up/down**
- `Ctrl + Shift + <UP/DOWN ARROW>`

> **Copy Paste Line UP/DOWN**
- `Shift + Alt + <UP/DOWN ARROW>`

> **Delete Line**
- `Ctrl + Shift + k` or - `Shift + Delete`

> **Move Curson To Left/Right Of Word**
- `Ctrl + <Left/Right Arrow>`

> **Comment code faster**
- `Ctrl + /` - Single line comment
- `Shift + Alt + A` - Multi-line/block comment
Note: Make sure that you selected syntax type, before commenting 

> **Sort Lines Alphabetically**
- TODO

### Traversing the Code

> **See directory & file hierarchy in file explorer**
- `ctrl+shift+e`

> **Hide file explorer**
- `ctrl+b`

> **Traversing all funtion in file**
- `ctrl+r`

> **Goto end/beginning of file**
- `ctrl+home` & - `ctrl+end`

> **Goto definition & back**
- `ctrl+<RIGHT ARROW>` & `ctrl+<LEFT ARROW>`

> **Opening file in project with name**
- `ctrl+p` & type file name with fuzzy search.

> **Switching between opened files**
- `ctrl+page down` & - `ctrl+page up`

> **Closing file**
- `ctrl+w`

> **Going to particular function,line or variable of file**
- `ctrl+r` & type function object variable name

> **Traverse all instance of symbol in file**
- `ctrl+f` typename & keep pressing enter key

> **Opening multiple layout**
- `Shift + Alt + 1` = single column
- `Shift + Alt + 2` = two column
- `Shift + Alt + 3` = three column
- `Shift + 1` = single row
- `Shift + 2` = two row

> **Switching/Toggle between layouts**
- `Ctrl + <no>`

> **Find project wide or find in all files**
- `Ctrl + Shift + f`

> **Jump to line**
- `Ctrl+g` & enter the line no

### Plugin/Packages
- [Microsoft C/C++ Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
- [Bracket Pair Colorizer](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer)
- [VS Sequential Number](https://marketplace.visualstudio.com/items?itemName=neptunedesign.vs-sequential-number)
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)

### Theme
- [Dracula Official](https://marketplace.visualstudio.com/items?itemName=dracula-theme.theme-dracula)
- [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme)

### Misc

> **Change default shell in windows / switch from powershell.exe to cmd.exe**
1. Press Ctrl+Shift+P to show all commands.
2. Type shell in the displayed text box to filter the list.
3. Select Terminal: Select Default Shell.

> **User Settings**
```
{
    "C_Cpp.updateChannel": "Insiders",
    "files.autoSave": "onFocusChange",
    "editor.fontFamily": "Lucida Console",
    "editor.wordWrap": "on",
    "editor.formatOnSave": true,
    "files.exclude": {
        "**/*.o": true
    },
    "workbench.colorTheme": "Dracula",
    "files.trimTrailingWhitespace": true,
    "search.quickOpen.includeSymbols": true,
    "search.exclude": {
        "**/*.axf": true,
        "**/*.bin": true,
        "**/*.elf": true,
        "**/*.o": true
    },
    "search.maintainFileSearchCache": true,
    "editor.minimap.maxColumn": 80,
    "codegnuglobal.executable": "C:\\msys64\\bin\\global.exe",
    "workbench.iconTheme": "material-icon-theme",
    "terminal.integrated.shell.windows": "C:\\Windows\\System32\\cmd.exe",
    "editor.multiCursorModifier": "ctrlCmd",
    "window.zoomLevel": 0,
    "editor.detectIndentation": false
}
```


> **keybindings.json**
- `Ctrl + Shift + p`, type & open `Open Keyboard Shortcuts(JSON)`. Add following lines.
```
// Place your key bindings in this file to override the defaultsauto[]
[
    {
        "key": "ctrl+up",
        "command": "-scrollLineUp",
        "when": "textInputFocus"
    },
    {
        "key": "ctrl+up",
        "command": "-search.action.focusSearchFromResults",
        "when": "firstMatchFocus && searchViewletVisible"
    },
    {
        "key": "ctrl+up",
        "command": "-selectPrevSuggestion",
        "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "ctrl+up",
        "command": "-search.focus.previousInputBox",
        "when": "inputBoxFocus && searchViewletVisible && !searchInputBoxFocus"
    },
    {
        "key": "ctrl+up",
        "command": "editor.action.insertCursorAbove",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+alt+up",
        "command": "-editor.action.insertCursorAbove",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+down",
        "command": "editor.action.insertCursorBelow",
        "when": "editorTextFocus"
    },
    {
        "key": "ctrl+alt+down",
        "command": "-editor.action.insertCursorBelow",
        "when": "editorTextFocus"
    },
    {
        "key": "alt+f3",
        "command": "-editor.action.dirtydiff.next",
        "when": "editorTextFocus"
    },
    {
        "key": "alt+f3",
        "command": "editor.action.selectHighlights",
        "when": "editorFocus"
    },
    {
        "key": "ctrl+shift+l",
        "command": "-editor.action.selectHighlights",
        "when": "editorFocus"
    },
    {
        "key": "ctrl+shift+down",
        "command": "-cursorDownSelect",
        "when": "textInputFocus"
    },
    {
        "key": "ctrl+shift+up",
        "command": "-cursorUpSelect",
        "when": "textInputFocus"
    },
    {
        "key": "ctrl+shift+down",
        "command": "editor.action.moveLinesDownAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "alt+down",
        "command": "-editor.action.moveLinesDownAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+shift+up",
        "command": "editor.action.moveLinesUpAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "alt+up",
        "command": "-editor.action.moveLinesUpAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+right",
        "command": "-breadcrumbs.focusNext",
        "when": "breadcrumbsActive && breadcrumbsVisible"
    },
    {
        "key": "ctrl+right",
        "command": "-cursorWordEndRight",
        "when": "textInputFocus"
    },
    {
        "key": "ctrl+right",
        "command": "editor.action.revealDefinition",
        "when": "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor"
    },
    {
        "key": "f12",
        "command": "-editor.action.revealDefinition",
        "when": "editorHasDefinitionProvider && editorTextFocus && !isInEmbeddedEditor"
    },
    {
        "key": "ctrl+left",
        "command": "-breadcrumbs.focusPrevious",
        "when": "breadcrumbsActive && breadcrumbsVisible"
    },
    {
        "key": "ctrl+left",
        "command": "-cursorWordStartLeft",
        "when": "textInputFocus"
    },
    {
        "key": "ctrl+left",
        "command": "-list.collapseAll",
        "when": "listFocus && !inputFocus"
    },
    {
        "key": "ctrl+left",
        "command": "workbench.action.navigateBack"
    },
    {
        "key": "alt+left",
        "command": "-workbench.action.navigateBack"
    },
    {
        "key": "ctrl+r",
        "command": "-workbench.action.openRecent"
    },
    {
        "key": "ctrl+r",
        "command": "-workbench.action.quickOpenNavigateNextInRecentFilesPicker",
        "when": "inQuickOpen && inRecentFilesPicker"
    },
    {
        "key": "f5",
        "command": "-workbench.action.debug.continue",
        "when": "inDebugMode"
    },
    {
        "key": "f5",
        "command": "-workbench.action.debug.start",
        "when": "!inDebugMode"
    },
    {
        "key": "f5",
        "command": "workbench.action.reloadWindow",
        "when": "editorFocus"
    },
    {
        "key": "ctrl+r",
        "command": "-workbench.action.reloadWindow",
        "when": "isDevelopment"
    },
    {
        "key": "ctrl+shift+o",
        "command": "-workbench.action.gotoSymbol"
    },
    {
        "key": "shift+alt+2",
        "command": "workbench.action.editorLayoutTwoColumns"
    },
    {
        "key": "shift+alt+1",
        "command": "workbench.action.editorLayoutSingle"
    },
    {
        "key": "shift+alt+3",
        "command": "workbench.action.editorLayoutThreeColumns"
    },
    {
        "key": "ctrl+shift+2",
        "command": "workbench.action.editorLayoutTwoRows"
    },
    {
        "key": "ctrl+shift+3",
        "command": "workbench.action.editorLayoutThreeRows"
    },
    {
        "command": "vs-sequential-number.generate",
        "key": "ctrl+shift+s"
    },
    {
        "key": "ctrl+shift+d",
        "command": "-workbench.view.debug"
    },
    {
        "key": "shift+alt+down",
        "command": "editor.action.copyLinesDownAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "shift+alt+down",
        "command": "-editor.action.copyLinesDownAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+r",
        "command": "C_Cpp.Navigate",
        "when": "editorTextFocus && editorLangId == 'cpp'"
    },
    {
        "key": "alt+n",
        "command": "-C_Cpp.Navigate",
        "when": "editorTextFocus && editorLangId == 'cpp'"
    },
    {
        "key": "ctrl+r",
        "command": "C_Cpp.Navigate",
        "when": "editorTextFocus && editorLangId == 'c'"
    },
    {
        "key": "alt+n",
        "command": "-C_Cpp.Navigate",
        "when": "editorTextFocus && editorLangId == 'c'"
    },
    {
        "key": "escape",
        "command": "-workbench.action.hideInterfaceOverview",
        "when": "interfaceOverviewVisible"
    },
    {
        "key": "escape",
        "command": "removeSecondaryCursors",
        "when": "editorHasMultipleSelections && textInputFocus"
    },
    {
        "key": "shift+alt+left",
        "command": "-editor.action.smartSelect.shrink",
        "when": "editorTextFocus"
    }
]
```
> **How to disable package?**
- 
> **To see sublime command or CLI**

# Build Systems

> **C++ single file build setting**
- Prerequisites:
 1. `MinGW` installation in directory `C:/MinGW`
- `tasks.json` (COMPILING) : make sure you are running this script on cmd.exe not powershell.exe
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
                "${fileDirname}\\${fileBasenameNoExtension}.exe",
                "&&",
                "${fileDirname}\\${fileBasenameNoExtension}.exe<${fileDirname}\\inputf.in>${fileDirname}\\outputf.in"
            ],
            "options": {
                "cwd": "C:\\MinGW\\bin"
            },
            "problemMatcher": [
                "$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            }
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

## Benefits over sublime
- Can open image as well
- Debugging is more intuitive


## Drawbacks over sublime
- bit slower
- need map drive for network file to use feature of goto declaration
