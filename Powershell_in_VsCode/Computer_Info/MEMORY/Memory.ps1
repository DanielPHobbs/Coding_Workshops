<#	
	.NOTES
	===========================================================================
	 Created with: 	Visual Studio Code 
	 Created on:   	15/04/2019 15:34
	 Created by:   	danny
	 Organization: 	DTEK IT Innovations ltd
	 Filename: 		Get-MemoryConfig.ps1    	
	===========================================================================
	.DESCRIPTION
		Retrives the bios information 
#>

Set-StrictMode -Version 3

#// Init Variables 
[string]$strComputer = ''
$PysicalMemory =@()
$TotalSlots =@()
[INT]$UsedSlots=0


$strComputer = $env:computername
cls
$PysicalMemory = Get-WmiObject -class "win32_physicalmemory" -namespace "root\CIMV2" -ComputerName $strComputer

Write-Host "Memory Modules:" -ForegroundColor Green
$PysicalMemory | Format-Table Tag,BankLabel,@{n="Capacity(GB)";e={$_.Capacity/1GB}},Manufacturer,PartNumber,Speed -AutoSize

Write-Host "Total Memory:" -ForegroundColor Green
Write-Host "$((($PysicalMemory).Capacity | Measure-Object -Sum).Sum/1GB)GB"

$TotalSlots = ((Get-WmiObject -Class "win32_PhysicalMemoryArray" -namespace "root\CIMV2" -ComputerName $strComputer).MemoryDevices | Measure-Object -Sum).Sum
Write-Host "`nTotal Memory Slots:" -ForegroundColor Green
Write-Host $TotalSlots

$UsedSlots = (($PysicalMemory) | Measure-Object).Count 
Write-Host "`nUsed Memory Slots:" -ForegroundColor Green
Write-Host $UsedSlots

If($UsedSlots -eq $TotalSlots)
{
    Write-Host "All memory slots are filled up, none is empty!" -ForegroundColor Yellow
}
