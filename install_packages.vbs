Rexe           = "Rscript.exe"
Ropts          = "--vanilla"
RScriptFile    = "install_packages.r"
Command        = Rexe & " " & Ropts & " " & RScriptFile

intWindowStyle = 1    ' Hide the window and activate another window.'
bWaitOnReturn  = True ' continue running script after launching R   '

CreateObject("Wscript.Shell").Run Command, intWindowStyle, bWaitOnReturn
