$input = Get-content -path "C:\temp\data.txt"
$rows = @()
$columns = @()

[int64]$totalsum = 0
foreach($row in $input){
    $rows += ,($row -split '\s+' | Where-Object { $_ -ne "" })  
}

for ($i = 0; $i -lt $row.length; $i++){
    $column = @()
    foreach($row in $rows){
        $column += $row[$i]
    }
    $columns += ,$column
}


foreach($column in $columns){
    $operator = $column[-1]
    [int64]$totalproduct = 1

    for ($i =0; $i -lt $column.length -1; $i++){
        if ($column[-1] -eq "*"){
            
            $totalproduct *= [int64]$column[$i]
        } elseif ($column[-1] -eq "+"){
            $totalproduct = 0
            $totalsum += $column[$i]
        }
    }
    $totalsum += $totalproduct 

}

#quick easy and ugly but gets the job done quickly
$totalsum
