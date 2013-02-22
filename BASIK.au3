#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=build_resources\icon.ico
#AutoIt3Wrapper_Outfile=BASIK.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Run_Tidy=y
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****
#region ;Standard Includes Placed Here
#include <String.au3>
#include <Array.au3>
#endregion ;Standard Includes Placed Here

#region ;Base Modules Are Included Here
#include "bModules\getUniquePCID.au3"
#include "bModules\pcReport.au3"
#include "bModules\getAIMInfo.au3"
#include "bModules\getAIMModsList.au3"
#endregion ;Base Modules Are Included Here

#region
Opt("TrayMenuMode", 1)
$menuExit = TrayCreateMenu("Exit")

While 1

WEnd


#endregion

#region ;Function Calls From Base Modules Placed Here
pcReport() ; Generate PC Report
$AIMNames = getAIMModsList()
#endregion ;Function Calls From Base Modules Placed Here

For $AIMName In $AIMNames
	If $AIMName <> "" Then
		RunWait(@AutoItExe & " /AutoIt3ExecuteScript  " & "AIMs\" & $AIMName, @ScriptDir)
	EndIf
Next