Rexe           = "Rscript.exe"
Ropts          = "--vanilla --no-Rconsole"
RScriptFile    = "main.r"
Outfile        = "run.log" 
Command        = Rexe & " " & Ropts & " " & RScriptFile & " 1>nul " & " 2> " & Outfile

intWindowStyle = 0     ' Hide the window and activate another window.'
bWaitOnReturn  = False ' continue running script after launching R   '

CreateObject("Wscript.Shell").Run Command, intWindowStyle, bWaitOnReturn
