```
#SingleInstance,Force

SetCapsLockState, alwaysoff    ; Turn of capslock key functionality, which is remapped to shift + capslock

+CapsLock::			; shift + capslock
{
	if GetKeyState("CapsLock", "T") = 1
	{
		SetCapsLockState, Off
	}
	else if GetKeyState("CapsLock", "F") = 0
	{
		SetCapsLockState, On
	}
}
return

; Google Search highlighted text ------------------------------------------------------------------------------------
^+c::
{
	Send, ^c
	Run, http://www.google.com/search?q=%clipboard%
	Return
}

; Long press escape to close the window ------------------------------------------------------------------------------
$Escape::                                               ; Long press (> 0.5 sec) on Esc closes window - but if you change your mind you can keep it pressed for 3 more seconds
    KeyWait, Escape, T0.5                               ; Wait no more than 0.5 sec for key release (also suppress auto-repeat)
    If ErrorLevel                                       ; timeout, so key is still down...
	{
		SoundPlay *16                             	; Play Hand (stop/error)
		WinGet, X, ProcessName, A
		SplashTextOn,,150,,`nRelease button to close %x%`n`nKeep pressing it to NOT close window...
		KeyWait, Escape, T3                         ; Wait no more than 3 more sec for key to be released
		SplashTextOff
		If !ErrorLevel                              ; No timeout, so key was released
		{
			PostMessage, 0x112, 0xF060,,, A     ; ...so close window      
			Return
		}                
		SoundPlay *64
		KeyWait, Escape                             ; Wait for button to be released
													; Then do nothing...            
		Return
	}
	
	Send {Esc}
return


; Virtual desktop switch on double right click mouse -------------------------------------------------------------------
RButton::
{
	timeout = 0.5
	Send {RButton}
	Keywait RButton 					; wait for release
	KeyWait RButton, D, T%timeout% 		; wait for pressed again
	If ErrorLevel = 1 					;If you don't click again within %timeout%
	{
		;MsgBox, timeout	
	}
	else
	{
		; Change the session id(..\SessionInfo\2[<<<<<<HERE]\VirtualDesktops\..) in below line if virtual desktop is not updating correctly
		RegRead, cur, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\1\VirtualDesktops, CurrentVirtualDesktop
		RegRead, all, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VirtualDesktops, VirtualDesktopIDs
		virtual_desktop := floor(InStr(all,cur) / strlen(cur))

		If virtual_desktop > 0
		{		
			Send ^#{left}				; Presses Ctrl + Win + Left arrow key.
		}
		else
		{		
			Send ^#{right}				; Presses Ctrl + Win + Right.			
		}
	}
}
return

; Renabling numpad 0 key------------------------------------------------------------------------------------------------ 
Numpad0::
Send {0}
return

; Password entry   ----------------------------------------------------------------------------------------------------- 
Numpad0 & NumpadDot::
Send Aug@2019
return


; Calc shortcuts ----------------------------------------------------------------------------------------------------
CapsLock & Numpad1::			; swithc through active windows of same app
{
	if WinExist("Calculator")
		WinActivate ; use the window found above
	else
		Run, C:\Windows\System32\calc.exe
}
return

Numpad0 & Numpad1::				; Open fresh
Run, C:\Windows\System32\calc.exe
return

; Notepad shortcut ----------------------------------------------------------------------------------------------------
CapsLock & Numpad2::			; swithc through active windows of same app
{
	if WinExist("Notepad")
		WinActivate ; use the window found above
	else
		Run, notepad.exe
}
return

Numpad0 & Numpad2::			; Open fresh
Run, notepad.exe
return

; vscode shortcut -----------------------------------------------------------------------------------------------------
CapsLock & Numpad3::
{
	IfWinExist ,, "Visual Studio Code"
		WinActivate ; use the window found above
	else
		Run, C:\Users\chovatiy\AppData\Local\Programs\Microsoft VS Code\Code.exe
}
return

; New mail using Ctrl + m --------------------------------------------------------------------------------------------
^m::
Run, C:\Program Files (x86)\Microsoft Office\root\Office16\OUTLOOK.EXE /c ipm.note
return

; ----------------------------------------------------------------------------------------------------
Numpad0 & NumpadAdd::
MsgBox Hot key not decided yet
return




```
