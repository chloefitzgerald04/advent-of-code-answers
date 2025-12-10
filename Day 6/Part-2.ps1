$path = "C:\temp\aoc6.txt"
[int64]$totalsum = 0

#Index where the characters are on the last line - these always signify the start of a new column. This will mark our splits
$lastline = Get-Content $path | select -last 1
$cuts = for ($i=0; $i -lt $lastline.Length; $i++) {
    if ($lastline[$i] -ne ' ') { $i }
}

$lines = Get-Content $path
$columns = @()

# Split the file following the index above
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


    foreach ($num in $numbers) {
        for ($i = 0; $i -lt $num.Length; $i++) {
            if (-not $digitGroups.ContainsKey($i)) { $digitGroups[$i] = "" }
            $digitGroups[$i] += $num[-$i]
        }
    }
    $newnumbers = @()
    foreach ($key in ($digitGroups.Keys | Sort-Object)) {
        $newnumbers += ,$($digitGroups[$key] )
    }

    #some reason it had a "    " number in it so ig just replaced it. Probably way easier ways to do this
    $sanitisednewnumbers = $newnumbers -replace "    ", "" | Where-Object { [int]$_ -ne 0 }
    
    #apply the actual calculation
    [int64]$totalproduct = 1
    switch ($operator.Trim()) {
        "+" {
            foreach ($n in $sanitisednewnumbers) {
                Write-Host "+ $n"
                $totalsum += [int64]$n
            }
            #prevent unnecesary +1s 
            $totalproduct = 0
        }
        "*" {
            foreach ($n in $sanitisednewnumbers) {
                Write-Host "* $n"
                $totalproduct *= [int64]$n
            }
        }
    }
    $totalsum += $totalproduct 
}
$totalsum
