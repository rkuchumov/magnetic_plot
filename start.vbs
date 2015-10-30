Set oWShell = Wscript.CreateObject("WScript.Shell")
R_HOME = oWShell.ExpandEnvironmentStrings("%R_HOME%")

if R_HOME = "%R_HOME%" Then
	Wscript.Echo "R_HOME environment variable is not set"
	Wscript.Quit
End If

strRexe           = R_HOME & "\bin\Rscript.exe"

Set objFSO = CreateObject("Scripting.FileSystemObject")
If not(objFSO.FileExists(strRexe)) Then
    Wscript.Echo "Can't find " & strRexe
	Wscript.Quit
End If

strRopts          = "--vanilla"
srtRScriptFile    = "main.r"
strOutfile        = "run.log" 
srtCommand        = chr(34) & strRexe & chr(34) & " " & strRopts & " " & srtRScriptFile & " 1>" & strOutfile & " 2>nul"

intWindowStyle = 0
bWaitOnReturn  = False

oWShell.Run srtCommand, intWindowStyle, bWaitOnReturn
