Param(
	[string]$K2ServerWithAllEnvSettings="TVPRKWF001",
	[string]$WorkingPath="C:\tfs\K2.Shared\"
   )

# # # Write-Host "** including generic functions"
# # # . .\includeGenericFunctions.ps1
# # # Write-Host "** including k2 functions"
# # # . .\includeK2Functions.ps1
# # # Write-Host "** finished including functions"

$CURRENTDIR=pwd
trap {write-host "error"+ $error[0].ToString() + $error[0].InvocationInfo.PositionMessage  -Foregroundcolor Red; cd "$CURRENTDIR"; read-host 'There has been an error'; break}

$ErrorActionPreference ="Stop"

"blah" | write-debug

 ###   . $WorkingPath\Scripts\1.RegisterK2HelperModules.ps1
    . $WorkingPath\Scripts\2.BuildAllProjects.ps1 -SourceCodePath $WorkingPath -Configuration Debug
    . $WorkingPath\Scripts\3.CopyFiles.ps1  -Configuration Debug -CurrentPath $WorkingPath 
    ###. $WorkingPath\Scripts\4.BuildAndPAckageK2SharedSolution.ps1 -SourceCodePath $WorkingPath -K2ServerWithAllEnvSettings "TVPRKWF001"
    

#####TODO: CALLING CODE HERE

If($DoNotStop){Write-Host "======Finished======"} else {Read-Host "======Finished======"}