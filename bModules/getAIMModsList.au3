Func getAIMModsList()
	$AIMModListPath = @ScriptDir & "\app_data\AIMModsList.bx" ; absolute path is stored in variable $AIMModListPath by storing the Directory path containing currently running script concatenated to "\app_data\AIMModsList.bx"
	If FileExists($AIMModListPath) Then ; Check if the path given by $AIMModListFile exists
		$AIMModsListFile = FileOpen($AIMModListPath, 0) ; If exists, open file path stored in variable $AIMModsListPath for reading and store the file descriptor in variable $AIMModListFile
		Dim $AIMNames[1] ; Define a new array with size 1
		Dim $count = 0 ; Define a new variable $count and initialise it to 0
		While 1 ; Infinite loop starts
			$AIMName = FileReadLine($AIMModsListFile) ; Read a line from the file whose file descriptor is given in variable $AIMModsListFile and store in vriable $AIMName
			If @error = -1 Then ExitLoop ; If end of file is reached, end the while loop
			;MsgBox(4096, "Line read:", $AIMName)
			$AIMNames[$count] = $AIMName ; Store the line in $AIMName in the array $AIMNames at index given by $count
			ReDim $AIMNames[UBound($AIMNames) + 1] ; Reinitialize the $AIMNames array to an incremented size by finding the size of the array using the UBound function and incrementing it
			$count = $count + 1 ; Increment $count variable
		WEnd
		ReDim $AIMNames[UBound($AIMNames) - 1] ; Reinitialize the $AIMNames array to a decremented size of the array
		FileClose($AIMModsListFile) ; Close the currently opened file whose file descriptior is given by the variable $AIMModsListFile
		Return $AIMNames ; Return the $AIMNames variable if path exists
	Else
		$AIMModsListFile = FileOpen($AIMModListPath, 10)
		FileClose($AIMModsListFile)
		Return 0
	EndIf
EndFunc