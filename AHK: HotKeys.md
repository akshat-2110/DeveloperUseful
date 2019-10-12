```
#SingleInstance,Force

; New mail using Ctrl + m 
Run, "%programfiles%\Microsoft Office\OFFICE11\OUTLOOK.EXE" /c ipm.note


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
timeout = 0.5
Send {RButton}
Keywait RButton 					; wait for release
KeyWait RButton, D, T%timeout% 		; wait for pressed again
toggle_virtual_desktop()
return

; Renabling numpad 0 key------------------------------------------------------------------------------------------------ 
Numpad0::
Send {0}
return

; Password entry   ----------------------------------------------------------------------------------------------------- 
Numpad0 & NumpadDot::
Send reset@123
return


; Calc shortcut ----------------------------------------------------------------------------------------------------
Numpad0 & Numpad1::
Run, C:\Windows\System32\calc.exe
return

; Notepad shortcut ----------------------------------------------------------------------------------------------------
Numpad0 & Numpad2::
Run, notepad.exe
return

; vscode shortcut -----------------------------------------------------------------------------------------------------
Numpad0 & Numpad3::
Run, C:\Users\vishal\AppData\Local\Programs\Microsoft VS Code\Code.exe
return

; ----------------------------------------------------------------------------------------------------
Numpad0 & NumpadAdd::
MsgBox Hot key not decided yet
return





















toggle_virtual_desktop()
{

	If ErrorLevel = 1 					;If you don't click again within %timeout%
	{
		;MsgBox, timeout	
	}
	else
	{
		; Change the session id(..\SessionInfo\2[<<<<<<HERE]\VirtualDesktops\..) in below line if virtual desktop is not updating correctly
		RegRead, cur, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SessionInfo\2\VirtualDesktops, CurrentVirtualDesktop
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

```
