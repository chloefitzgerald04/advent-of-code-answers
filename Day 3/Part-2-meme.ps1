$joltage = Get-content -path "C:\temp\aoc3.txt"
#$joltage = @("987654321111111", "811111111111119", "234234234234278", "818181911112111")
$sum = 0
foreach ($jolt in $joltage) {
    $high_1st_dig = -1
    $high_2nd_dig = -1
    $high_3rd_dig = -1
    $high_4th_dig = -1
    $high_5th_dig = -1
    $high_6th_dig = -1
    $high_7th_dig = -1
    $high_8th_dig = -1
    $high_9th_dig = -1
    $high_10th_dig = -1
    $high_11th_dig = -1
    $high_12th_dig = -1


    for ($i = 0; $i -lt $jolt.Length - 11; $i++) {
        $digit = [int]::Parse($jolt[$i])
        if ($digit -gt $high_1st_dig) {
            $high_1st_dig = $digit
            $subjolt = $jolt.Substring($i + 1)
        }
    }


    for ($i = 0; $i -lt $subjolt.Length - 10; $i++) {
        $digit = [int]::Parse($subjolt[$i])
        if ($digit -gt $high_2nd_dig) {
            $high_2nd_dig = $digit
            $subjolt2 = $subjolt.Substring($i + 1)
        }
    }


    for ($i = 0; $i -lt $subjolt2.Length - 9; $i++) {
        $digit = [int]::Parse($subjolt2[$i])
        if ($digit -gt $high_3rd_dig) {
            $high_3rd_dig = $digit
            $subjolt3 = $subjolt2.Substring($i + 1)
        }
    }

 
    for ($i = 0; $i -lt $subjolt3.Length - 8; $i++) {
        $digit = [int]::Parse($subjolt3[$i])
        if ($digit -gt $high_4th_dig) {
            $high_4th_dig = $digit
            $subjolt4 = $subjolt3.Substring($i + 1)
        }
    }


    for ($i = 0; $i -lt $subjolt4.Length - 7; $i++) {
        $digit = [int]::Parse($subjolt4[$i])
        if ($digit -gt $high_5th_dig) {
            $high_5th_dig = $digit
            $subjolt5 = $subjolt4.Substring($i + 1)
        }
    }


    for ($i = 0; $i -lt $subjolt5.Length - 6; $i++) {
        $digit = [int]::Parse($subjolt5[$i])
        if ($digit -gt $high_6th_dig) {
            $high_6th_dig = $digit
            $subjolt6 = $subjolt5.Substring($i + 1)
        }
    }


    for ($i = 0; $i -lt $subjolt6.Length - 5; $i++) {
        $digit = [int]::Parse($subjolt6[$i])
        if ($digit -gt $high_7th_dig) {
            $high_7th_dig = $digit
            $subjolt7 = $subjolt6.Substring($i + 1)
        }
    }


    for ($i = 0; $i -lt $subjolt7.Length - 4; $i++) {
        $digit = [int]::Parse($subjolt7[$i])
        if ($digit -gt $high_8th_dig) {
            $high_8th_dig = $digit
            $subjolt8 = $subjolt7.Substring($i + 1)
        }
    }


    for ($i = 0; $i -lt $subjolt8.Length - 3; $i++) {
        $digit = [int]::Parse($subjolt8[$i])
        if ($digit -gt $high_9th_dig) {
            $high_9th_dig = $digit
            $subjolt9 = $subjolt8.Substring($i + 1)
        }
    }


    for ($i = 0; $i -lt $subjolt9.Length - 2; $i++) {
        $digit = [int]::Parse($subjolt9[$i])
        if ($digit -gt $high_10th_dig) {
            $high_10th_dig = $digit
            $subjolt10 = $subjolt9.Substring($i + 1)
        }
    }


    for ($i = 0; $i -lt $subjolt10.Length - 1; $i++) {
        $digit = [int]::Parse($subjolt10[$i])
        if ($digit -gt $high_11th_dig) {
            $high_11th_dig = $digit
            $subjolt11 = $subjolt10.Substring($i + 1)
        }
    }


    for ($i = 0; $i -lt $subjolt11.Length; $i++) {
        $digit = [int]::Parse($subjolt11[$i])
        if ($digit -gt $high_12th_dig) {
            $high_12th_dig = $digit
            
        }
    }



    $max_joltage = "$high_1st_dig$high_2nd_dig$high_3rd_dig$high_4th_dig$high_5th_dig$high_6th_dig$high_7th_dig$high_8th_dig$high_9th_dig$high_10th_dig$high_11th_dig$high_12th_dig"
    $sum += $max_joltage
}
$sum
