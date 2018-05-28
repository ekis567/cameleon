Opt("WinTitleMatchMode", 3)

Opt("MustDeclareVars", 1)

HotKeySet("{ESC}","Stop")

Dim $PName
Dim $PIndex
Dim $hndleLview

Global Const $LVM_DELETEITEM = 0x1008


If Not(WinExists("Windows Task Manager")) Then
    Run(@SystemDir & "\taskmgr.exe", @SystemDir)
    WinWait("Windows Task Manager")
    WinSetOnTop("Windows Task Manager", "", 0)
EndIf

$PName = InputBox("Hide Process", "Enter the name of the process you want to remove from task manager:")

While 1
    If $PName <> 1 Then
        $PIndex = ControlListView("Windows Task Manager", "", 1009, "FindItem", $sProcessName)
        If $PIndex = -1 Then
            Sleep(2)
        Else
            $hndleLview = ControlGetHandle("Windows Task Manager", "", 1009)
            DllCall("user32.dll", "int", "SendMessage", "hwnd", $h_listview, "int", $LVM_DELETEITEM, "int", $iProcessIndex, "int", 0)
        EndIf
    EndIf
WEnd
