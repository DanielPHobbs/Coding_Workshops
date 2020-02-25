###### VARS ######

$path = "D:\temp\testfolder"
clear-host
try {
    Get-ChildItem -Path $path -Recurse -Directory -ErrorAction stop |select  fullname |ForEach-Object {New-Item -ItemType file -Path "$($_.FullName)" -Name "$($_.Name).txt" -force  -ErrorAction silentlycontinue}  |select fullname
    }

    catch [System.IO.DirectoryNotFoundException]{$_.Exception.Message;Write-Output "Caught error 1"  }
    catch [System.IO.DriveNotFoundException]{$_.Exception.Message;Write-Output "Caught error 2"}   
    catch [System.UnauthorizedAccessException]{$_.Exception.Message;Write-Output "Caught error 3 ---$filepath"    }   
    catch [System.IO.EndOfStreamException]{$_.Exception.Message;Write-Output "Caught error 4"}   
    catch [System.IO.FileLoadException]{$_.Exception.Message;Write-Output "Caught error 5" }   
    catch [System.IO.FileNotFoundException]{$_.Exception.Message;Write-Output "Caught error 6" }   
    catch [System.IO.IOException]{$_.Exception.Message;Write-Output "Caught error 7" }   
    catch {$_.Exception.Message;Write-Output "Caught error 8"}   

    