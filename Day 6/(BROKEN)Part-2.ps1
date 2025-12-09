$path = "C:\temp\aoc6.txt"
[int64]$totalsum = 0
$lastline = Get-Content $path | select -last 1
$cuts = for ($i=0; $i -lt $lastline.Length; $i++) {
    if ($lastline[$i] -ne ' ') { $i }
}

$lines = Get-Content $path
$columns = @()  

for ($col = 0; $col -lt $cuts.Count - 1; $col++) {
    $start = $cuts[$col]
    $length = $cuts[$col+1] - $cuts[$col]

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
    if($operator -eq "*"){
        [int64]$totalproduct = 1
    }
    # Loop through each number in the column
    foreach ($num in $numbers) {
        $numStr = $num.Trim()  # Remove spaces
        for ($i = 0; $i -lt $numStr.Length; $i++) {
            if (-not $digitGroups.ContainsKey($i)) { $digitGroups[$i] = "" }
            $digitGroups[$i] += $numStr[$i]
        }
    }
    $newnumbers = @()
    foreach ($key in ($digitGroups.Keys | Sort-Object)) {
        $newnumbers += ,$($digitGroups[$key])
    }
    foreach ($newnum in $newnumbers){
        if ($operator -like "+"){
            [int64]$totalsum += $newnum
        }
    }
}
$totalsum
