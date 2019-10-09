
```
#SingleInstance,Force

timeout = 0.5

RButton::
Send {RButton}
Keywait RButton 					; wait for release
KeyWait RButton, D, T%timeout% 		; wait for pressed again
If ErrorLevel = 1 					;If you don't click again within %timeout%
{
	;MsgBox, timeout	
}
else
{
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



```
