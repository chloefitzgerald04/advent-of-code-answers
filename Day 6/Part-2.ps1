$path = "C:\temp\aoc6.txt"
[int64]$totalsum = 0
$lastline = Get-Content $path | select -last 1
$cuts = for ($i=0; $i -lt $lastline.Length; $i++) {
    if ($lastline[$i] -ne ' ') { $i }
}

$lines = Get-Content $path
$columns = @()

for ($col = 0; $col -lt $cuts.Count; $col++) {
    $start = $cuts[$col]
    $length = if ($col + 1 -lt $cuts.Count) { $cuts[$col + 1] - $cuts[$col] } else { $lastline.Length - $start }

    $colValues = @()
    foreach ($line in $lines) {
        if ($line.Length -ge $start + $length) {
            $colValues += $line.Substring($start, $length)
        } elseif ($line.Length -gt $start) {
            $colValues += $line.Substring($start)
        } else {
            $colValues += ""
        }
    }

    $columns += ,$colValues
}


foreach ($column in $columns) {
    
    $numbers = $column | Where-Object { $_ -match '\d' }
    $operator = $column | Where-Object { $_ -notmatch '\d' }
    $digitGroups = @{}
    [int64]$totalproduct = 1
    foreach ($num in $numbers) {
        for ($i = 0; $i -lt $num.Length; $i++) {
            if (-not $digitGroups.ContainsKey($i)) { $digitGroups[$i] = "" }
            $digitGroups[$i] += $num[-$i]
        }
    }
    $newnumbers = @()
    foreach ($key in ($digitGroups.Keys | Sort-Object)) {
        $newnumbers += ,$($digitGroups[$key])
    }


    #some reason it had a "    " number in it so ig just replaced it. Probably way easier ways to do this
    $sanitisednewnumbers = @()
    foreach ($x in $newnumbers){
      $y = $x -replace "    ", $null
      if ([int]$y -ne 0){
        $sanitisednewnumbers += $y
      }
    }

    #apply the actual calculation
    foreach ($newnum in $sanitisednewnumbers){ 
         if(($operator.trim()) -eq "+"){
            write-host "+" $newnum
           [int64]$totalsum += [int64]$newnum
           #prevent unnec
           [int64]$totalproduct = 0
         } elseif (($operator.trim()) -eq "*"){
            write-host "*" $newnum
           [int64]$totalproduct *= [int64]$newnum
         }
     }
    $totalsum += $totalproduct 
}
$totalsum
