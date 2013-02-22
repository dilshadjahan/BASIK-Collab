Func getUniquePCID()

	#include-once <Array.au3>

	$objWMIService  = ObjGet("winmgmts:{impersonationLevel=impersonate}")
	$netAdapterSet = $objWMIService.ExecQuery("select * from Win32_NetworkAdapter")

	$uniqueID = ""

	For $netAdapter in $netAdapterSet
		$uniqueID = $uniqueID & $netAdapter.MACAddress
	Next

	$uniqueID = DriveGetSerial(@HomeDrive & "\") & ":" & $uniqueID
	;MsgBox(0, "", $uniqueID)
	return $uniqueID

	$objNetwork = ""
	$netAdapterSet = ""

EndFunc