$input = Get-Content -Path "C:\temp\aoc9.txt"


$coords = $input | ForEach-Object {
    $parts = $_ -split ","
    [PSCustomObject]@{ X = [int64]$parts[0]; Y = [int64]$parts[1] }
}

[int64]$largestArea = 0


for ($i = 0; $i -lt $coords.Count; $i++) {
    for ($j = $i + 1; $j -lt $coords.Count; $j++) {
        $dx = [Math]::Abs($coords[$i].X - $coords[$j].X)
        $dy = [Math]::Abs($coords[$i].Y - $coords[$j].Y)
        [int64]$area = ($dx + 1) * ($dy + 1) 
        if ($area -gt $largestArea) {
            $largestArea = $area
        }
    }
}

$largestArea
