# First thing: use EOS Utility to take image.
# NOTE: this requires EOS Utility to be opened beforehand


add-type -AssemblyName microsoft.VisualBasic
add-type -AssemblyName System.Windows.Forms
start-sleep -Milliseconds 50   
[Microsoft.VisualBasic.Interaction]::AppActivate("EOS REBEL T2i")
[System.Windows.Forms.SendKeys]::SendWait(" ")
