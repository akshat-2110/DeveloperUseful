
CapsLocka::
	Suspend,permit
	suspendAll("toggle")
return

; q::
; 	Suspend,permit
; 	suspendAll("toggle")AaaaaAA
; return
; w::
; 	Suspend,permit
; 	suspendAll("on")
; return
; e::
; 	Suspend,permit
; 	suspendAll("off")
; return


suspendAll(mode:="toggle"){
	; Change suspension state of all ahk scripts.
	; Mode, "toggle", "on" or "off".
	; All credits to jeeswg, https://autohotkey.com/boards/viewtopic.php?p=158041#p158041
	; All blame on helgef.
	DHW_Setting:=A_DetectHiddenWindows
	DetectHiddenWindows, On
	WinGet,scriptHwnds,List, % "ahk_class AutoHotkey"
	Loop, % scriptHwnds
		if (mode="toggle") || ((isSuspended:=JEE_AhkWinIsSuspended(scriptHwnds%A_Index%)) && mode="off") || (!isSuspended && mode="on")
			PostMessage, 0x111, 65404,,, % "ahk_id " scriptHwnds%A_Index%
	DetectHiddenWindows, % DHW_Setting
	return
}

JEE_AhkWinIsSuspended(hWnd){
	SendMessage, 0x211,,,, % "ahk_id " hWnd ;WM_ENTERMENULOOP := 0x211
	SendMessage, 0x212,,,, % "ahk_id " hWnd ;WM_EXITMENULOOP := 0x212
	hMenuBar := DllCall("GetMenu", Ptr,hWnd, Ptr)
	hMenuFile := DllCall("GetSubMenu", Ptr,hMenuBar, Int,0, Ptr)
	;ID_FILE_SUSPEND := 65404
	vState := DllCall("GetMenuState", Ptr,hMenuFile, UInt,65404, UInt,0, UInt)
	vIsSuspended := (vState >> 3) & 1
	DllCall("CloseHandle", Ptr,hMenuFile)
	DllCall("CloseHandle", Ptr,hMenuBar)
	return vIsSuspended
}

