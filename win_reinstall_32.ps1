$url = "http://install-versions.risevision.com/installer-win-32.exe"
$outpath = "$PSScriptRoot/installer-win-32.exe"
$date = (Get-Date).ToString("yyyy-MM-dd")
$test = Test-Path "$HOME\AppData\local\rvplayer_$date"
$test1 = Test-Path "$HOME\AppData\local\rvplayer"

Write-Output "rvplayer_date check: $test"
Write-Output "rvplayer check: $test1"

if (Test-Path "$HOME\Appdata\local\rvplayer"){
	Rename-Item -Path "$HOME\Appdata\local\rvplayer" -NewName "rvplayer_$date" -ErrorAction Stop
}else{
	Write-Output "rvplayer not installed"
	exit
}
	
if (Test-Path "$HOME\AppData\local\rvplayer_$date"){
	Remove-Item -Path "$HOME\AppData\local\rvplayer_$date" -recurse
}
	

Invoke-WebRequest -Uri $url -OutFile $outpath
Start-Process -Filepath $outpath

if ($Host.Name -eq "ConsoleHost")
{
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
}