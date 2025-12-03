$joltage = Get-content -path "C:\temp\data.txt"
$joltagesum = 0

foreach ($jolt in $joltage) {
    $high_1st_dig = -1
    $high_2nd_dig = -1
    
    # Loops through each number and finds the largest number which isnt at the end of the string
    for ($i = 0; $i -lt $jolt.Length - 1; $i++) {
        # Parses the indexed value as a 32bit signed integer for comparison
        $digit_1 = [int]::parse($jolt[$i])

        # Checks if number is higher than one before it
        if ($digit_1 -gt $high_1st_dig) {
            $high_1st_dig = $digit_1
            
            # Creates a substring splitting from the high digit right. 
            $subjolt = $jolt.Substring($i)
        }
    }
    # Loops through each substring to find the highest digit in the second part.
    for ($x = 1; $x -lt $subjolt.Length; $x++) {

        $digit_2 = [int]::parse($subjolt[$x])

        if ($digit_2 -gt $high_2nd_dig) {
            $high_2nd_dig = $digit_2
            
        }
    }
    
    $highestdigit_2number = "$high_1st_dig" + "$high_2nd_dig"
    $joltagesum += $highestdigit_2number

}
$joltagesum
