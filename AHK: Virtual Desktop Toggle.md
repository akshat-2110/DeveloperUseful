```
#SingleInstance,Force

RButton::
timeout = 0.5
Send {RButton}
Keywait RButton 					; wait for release
KeyWait RButton, D, T%timeout% 		; wait for pressed again
toggle_virtual_desktop()

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
