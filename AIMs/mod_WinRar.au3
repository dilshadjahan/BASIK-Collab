;#Program Name: "WinRar"
;#Program Version: "4.20"

#include "common\helperFunctions.au3"
_AU3RecordSetup()

ShellExecute(@ScriptDir & "\setup_files\wrar420.exe")
;RunAs("Hirvesh", @ComputerName, "hir002", 0, @ScriptDir & "\setup_files\wrar420.exe")
_WinWaitActivate("WinRAR 4.20","")
;Send("{ENTER}")
ControlClick("WinRAR 4.20", "", "[CLASS:Button; INSTANCE:2]")
_WinWaitActivate("WinRAR Setup","Associate WinRAR wit")
ControlClick("WinRAR Setup", "", "[CLASS:Button; INSTANCE:27]")
_WinWaitActivate("WinRAR Setup","WinRAR has been succ")
ControlClick("WinRAR Setup", "", "[CLASS:Button; INSTANCE:1]")
_WinWaitActivate("WinRAR","Address: C:\ProgramD")
WinClose("WinRAR","Address: C:\ProgramD")