$length = 100

#Switches between demo and live datasets
#$inputs = @("L68", "L30", "R48", "L5", "R60", "L55", "L1", "L99", "R14", "L82")
$inputs = Get-Content "C:\temp\aoc1.txt"

$position = 50
$password = 0

#Iterates through each turn
foreach ($input in $inputs) {
    #Seperates direction from number of turns
    $direction = $input.Substring(0,1)
    $count = $input.replace($direction, "")

    #Brute forces the count... was the simplest solution not the quickest. 
    for ($i = 1; $i -le $count; $i++) {
        if ($direction -eq "R") {
            $position = ($position + 1) % $length
        } else {
            $position = ($position - 1 + $length) % $length
        }

        if ($position -eq 0) {
            $password++
        }
    }
}

$password
