Func getUniquePCID()

	$objWMIService  = ObjGet("winmgmts:{impersonationLevel=impersonate}")
	$netAdapterSet = $objWMIService.ExecQuery("select * from Win32_NetworkAdapter")

	$uniqueID = "" ; Initialise $uniqueID variable to empty string

	For $netAdapter in $netAdapterSet ; For each data element in array of $netAdapterSet
		$uniqueID = $uniqueID & $netAdapter.MACAddress ; Concatenate $uniqueID and MAC address of each net adapter
	Next

	$uniqueID = DriveGetSerial(@HomeDrive & "\") & ":" & $uniqueID ; Append Driver serial number, by providing the absolute address path of device, to the beginning of the unique ID obtained using a :
	;MsgBox(0, "", $uniqueID)
	return $uniqueID ; Return the $uniqueID variable content as result

	$objNetwork = "" ; Initialize $onjNetwork to null string for next object initialization
	$netAdapterSet = "" ; Initialize $netAdapterSet to null for next object initialization

EndFunc