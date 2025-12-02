$length = 100
# Switching between demo data and live
$inputs = @("L68", "L30", "R48", "L5", "R60", "L55", "L1", "L99", "R14", "L82" )
#$inputs = Get-content -path "C:\temp\aoc1.txt"

$position = 50
$password = 0

#iterates through each "L11" 
foreach($input in $inputs){

    #splits direction and number of turns
    $direction = $input.Substring(0,1)
    $count = $input.replace($direction, "")
    
    if($direction -eq "L"){
        $position = ($position - $count + $length) % $length
    } elseif ($direction -eq "R"){
        $position = ($position + $count) % $length
    }

    if($position -eq 0){
        $global:password += 1
    }
}

$password
