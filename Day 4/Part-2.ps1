
$input = Get-Content "C:\temp\aoc4.txt"

$rows = $input.Count
$cols = $input[0].Length

$neighbors = @(
    @(-1,-1), @(-1,0), @(-1,1),
    @(0,-1),           @(0,1),
    @(1,-1),  @(1,0),  @(1,1)
)

$totalRemoved = 0
$changes = $true

while ($changes) {
    $changes = $false

    $toRemove = @()

    for ($r = 0; $r -lt $rows; $r++) {
        for ($c = 0; $c -lt $cols; $c++) {

            if ($input[$r][$c] -eq '@') {
                $adjCount = 0

                foreach ($n in $neighbors) {
                    $nr = $r + $n[0]
                    $nc = $c + $n[1]

                    if ($nr -ge 0 -and $nr -lt $rows -and
                        $nc -ge 0 -and $nc -lt $cols) {
                        if ($input[$nr][$nc] -eq '@') {
                            $adjCount++
                        }
                    }
                }

                if ($adjCount -lt 4) {
                    $toRemove += [PSCustomObject]@{ Row = $r; Col = $c }
                }
            }
        }
    }

    foreach ($cell in $toRemove) {
        $row = $cell.Row
        $col = $cell.Col
        $input[$row] = $input[$row].Substring(0, $col) + '.' + $input[$row].Substring($col + 1)
        $totalRemoved++
        $changes = $true
    }
}

$totalRemoved
