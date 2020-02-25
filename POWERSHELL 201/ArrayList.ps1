$Iterations  = 100000
$OutputEvery = 1000
$Array = @()
    for ($i = 1 ; $i -le $Iterations ; $i++)
    {
        if (-not ($i % $OutputEvery)) { Write-Host  'Records processed:', $i }
    
        $Array += $i
}