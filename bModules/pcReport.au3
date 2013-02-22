;#include "getUniquePCID.au3"

Func pcReport()
	$pcReportPath = @ScriptDir & "\app_data\pcReport.bx"
	if FileExists($pcReportPath) Then ; Check if the file stored in $pcReportPath exists
		Return 0 ; If true, return 0
	Else
		$pcReportFile = FileOpen($pcReportPath, 10) ; Open file given by $pcReportPath on write mode and create directory structure and store the file descriptor in variable $pcREportFile
		FileWrite($pcReportFile, getUniquePCID()) ; Append a text data to end of already opened file given by file descriptor stored in $pcRrportFile and add data given by function getUniquePCID()
		FileClose($pcReportFile) ; Close the already opened file specified by the file descriptor strored in variable $pcReportFile
		Return 0
	EndIf
EndFunc