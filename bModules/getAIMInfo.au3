;Module Name: getAIMInfo

;#include <Array.au3>
;#include <String.au3>

;$AIMPath = @ScriptDir & "\mod_WinRar.au3"

;if (FileExists($AIMPath)) Then
;	getAIMInfo($AIMPath)
;EndIf

Func getAIMInfo($AIMPath)
	Dim $AIMInfo[1][2] ;Create an array of size 1 to keep the information about AIM
	Dim $InfoNo = 0 ; Initialize a variable to store Information Number
	If FileExists($AIMPath) Then ; Check if the AIM path provided as parameter exists
		$AIMFile = FileOpen($AIMPath, 0) ; If file exists, then open it for reading and store the file descriptor into variable $AIMFile

		While 1 ; Enter infinite loop
			$InfoLine = FileReadLine($AIMFile) ; Read first line from file whose file descriptor is stored in $AIMFile variable and store line in $InfoLine
			If @error = -1 Then ExitLoop ; Check if end of file reached. If it is end of file, exit infinite while loop
			If (checkInfoLine($InfoLine)) Then ; Check if line starts with ;# using checkInfoLine function with $InfoLine as parameter
				$infoName = _StringBetween($InfoLine, ';#', ':')
				$infoValue = _StringBetween($InfoLine, '"', '"') ; Extract the string found between the double quotes from $InfoLine and store it in $extractedInfo variable
				$AIMInfo[$InfoNo][0] = $infoName[0]
				$AIMInfo[$InfoNo][1] = $infoValue[0] ; Since an array can be returned, the first element is stored on $AIMInfo array at position given by $InfoNo
				ReDim $AIMInfo[UBound($AIMInfo) + 1][2] ; Reinitialise $AMInfo array to an added increment of the upper bound limit of the initialized array, by adding 1 to the limit
				$InfoNo = $InfoNo + 1 ; Increment $InfoNo variable to indicate to the next element in the array $AIMInfo for use
			EndIf
		WEnd
		ReDim $AIMInfo[UBound($AIMInfo) - 1][2] ; Reinitialise the $AIMInfo array to a decremented value of the upper bound array size
		_ArrayDisplay($AIMInfo)
		Return $AIMInfo ; Return the $AIMInfo array containing the information required
	Else
		Return -1 ; Return -1 if failed
	EndIf
EndFunc

Func checkInfoLine($InfoLine) ; Function to check the $InfoLine variable
	If (StringLeft($InfoLine, 2) == ";#") Then ; Check if the first two letters to teh left in the $InfoLine variable is ;#
		;MsgBox(0, "", "boom") ; If it is, display the message "boom"
		;MsgBox(0, "", $InfoLine) ; Display the $InfoLine variable content
		Return True ; Return true
	Else
		Return False ; Return false if no information line is found
	EndIf
EndFunc