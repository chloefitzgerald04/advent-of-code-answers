$lines = (Get-content -path "C:\temp\aoc5.txt")

$available_ingredient_ids = @()
$fresh_ingredient_ranges = @()
$fresh = @()


# Split into 2 arrays
## Array 1 contains the ranges $fresh_ingredient_ranges
## Array 2 contains the ingredients available $available_ingredient_ids
foreach ($line in $lines) {
    if ($line -match "-") {
        $fresh_ingredient_ranges += $line
    }
    elseif ($line -match "^\d+$") {
        $available_ingredient_ids += [int64]$line
    }
}

# Goes through each ID and checks if it fits in the range. 
foreach ($available_ingredient_id in $available_ingredient_ids){
    foreach($fresh_ingredient_range in $fresh_ingredient_ranges){
        $parts = $fresh_ingredient_range -split "-"
        $lowerbound = [int64]$parts[0]
        $upperbound = [int64]$parts[1]

        ## Used greater than less than rather than iterating through the array to make it a bit quicker
        if (($available_ingredient_id -ge $lowerbound) -and ($available_ingredient_id -le $upperbound)){
            ## Avoids duplication by checking whether the ID is in the fresh ingredients array.
            If (-not ($fresh -contains $available_ingredient_id)){
                $fresh += $available_ingredient_id
            }
        }
    }
}
$fresh.length
